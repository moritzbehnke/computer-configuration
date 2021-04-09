# Computer Configuration

This repo contains dotfiles as well as a Brewfile for an easy setup of a new computer.

## Installation

```sh
git clone --bare git@github.com:moritzbehnke/computer-configuration.git $HOME/.configuration
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
```

## Automatic Setup

Run the setup script for an automated setup:

```sh
sh .setup.sh
```

## Branching

- Commit general changes to `main` branch (machine specific branches will then need to be rebased).
- Commit machine specific changes to `work` or `private` branches.
