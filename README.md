# My dotfiles

This repo contains the dotfiles for macos and linux

[[TOC]]

## Requirements

Ensure you have the following installed on your system

- git
- fzf
- zoxide
- stow

## Installation

First, check out the dotfiles repo tho $HOME directory using git

```bash
$ git clone https://github.com/LukasHirsch99/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks:

```bash
$ stow .
```

## Configured Packages

### Zsh
To use zsh you need to install [zsh] and [zoxide](https://github.com/ajeetdsouza/zoxide).
If you wan't to set enironment variables, specify them in a $HOME/.env file.

```bash
export PATH=$PATH:~/.scripts/
path+=('/opt/homebrew/anaconda3/bin')
```

### Tmux
Install tpm (tmux plugin manager)
```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Hit `prefix` + `I` in tmux to install all plugins

### Neovim
Install Neovim >= 0.11.0

### Ghostty
Install ghostty terminal

## Brewfile
Use to install brew packages on new machine
