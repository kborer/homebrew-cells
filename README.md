# cells Homebrew tap

A maintained Homebrew formula for [terminal-cells](https://github.com/kborer/cells),
a living microscope slide in your terminal. Supports macOS and Homebrew on Linux.

```sh
brew install kborer/cells/terminal-cells
cells
cells --interactive
```

The executable is `cells`; the formula is `terminal-cells`. Python is installed
through Homebrew. The formula uses the immutable upstream release archive and its
verified SHA-256; it installs no third-party Python runtime dependencies.

```sh
brew update
brew upgrade kborer/cells/terminal-cells
brew uninstall terminal-cells
```

## Maintenance

Generate an updated formula with upstream `tools/homebrew.py` using the released
archives and manifest. Review changes in a PR and let install, functional tests,
and strict audit pass before merging. Source builds are supported; bottles are
not currently published. Report application bugs in the upstream repository.

Licensed under 0BSD.
