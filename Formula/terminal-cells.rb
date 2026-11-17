class TerminalCells < Formula
  desc "Living microscope slide in your terminal"
  homepage "https://github.com/kborer/cells"
  url "https://github.com/kborer/cells/releases/download/v0.1.1/terminal_cells-0.1.1.tar.gz"
  sha256 "d6c91cec27bb131ef16c49fd3b603109148f3ed0724ba09a332de815a61f66e8"
  license "0BSD"

  depends_on "python@3.14"

  def install
    libexec.install "terminal_cells"
    (bin/"cells").write <<~PYTHON
      #!#{formula_opt_bin("python@3.14")}/python3.14
      import sys
      sys.path.insert(0, "#{libexec}")
      from terminal_cells.cli import main
      main()
    PYTHON
    chmod 0755, bin/"cells"
    man1.install "docs/cells.1"
  end

  test do
    assert_equal "cells #{version}", shell_output("#{bin}/cells --version").strip
    snapshot = shell_output("#{bin}/cells --snapshot --seed 42 --size 80x24")
    assert_equal 24, snapshot.lines.length
    assert snapshot.lines.all? { |line| line.chomp.length == 80 }
    refute_empty snapshot.strip
  end
end
