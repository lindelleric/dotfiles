# Dotfiles

Uses gnu stow to manage dotfiles.

## Installation

```bash
git clone git@github.com:lindelleric/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow -t ~ */
```

Individual packages can be installed by specifying the package name.
```bash
stow -t ~ nvim
```
