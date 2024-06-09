# My dotfiles

This repo contains the dotfiles of my arch machine

[[TOC]]

## Requirements

Ensure you have the following installed on your system

- Git
- Stow

## Installation

First, check out the dotfiles repo tho $HOME directory using git

```
$ git clone https://github.com/LukasHirsch99/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```

## Configured Packages

### Zsh

To use zsh you need to install [oh-my-posh](https://github.com/jandedobbeleer/oh-my-posh) and [zoxide](https://github.com/ajeetdsouza/zoxide).

### Tmux
@TODO
