# Computer Configuration

This repo contains dotfiles as well as a Brewfile for an easy setup of a new computer.

## Before cloning this repo

```sh
# install xcode command line tools (includes git)
xcode-select —install

# install homebrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Cloning this repo

```sh
# clone the repo in the root directory without the enclosing folder
git clone --bare git@github.com:moritzbehnke/computer-configuration.git $HOME/.configuration

# setup git alias for configuration repo
alias config='/usr/bin/git --git-dir=$HOME/.configuration/ --work-tree=$HOME'

# exclude untracked files from git diff
config config --local status.showUntrackedFiles no`
```

Now you can use the config command to update configuration files.

Example:

```sh
config add .spaceshiprc.zsh
config commit 'added spaceship config file'
config push
```

## After cloning

### Install software from Brewfile

```sh
# install applications defined in the Brewfile
brew bundle install
```

### Install zsh customizations

```sh
# install oh-my-zsh spaceship prompt
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

# symlink to oh-my-zsh custom themes directory
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
