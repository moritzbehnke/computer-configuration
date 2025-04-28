export USERNAME="id -un"

# set editor for commit messages etc.
export EDITOR='code'

# Path to your oh-my-zsh installation.
export ZSH="/Users/$USERNAME/.oh-my-zsh"

# Path to homebrew
export PATH="/opt/homebrew/bin:$PATH"

# add java 17 link
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# setup custom git command for configuration repo
alias config='/usr/bin/git --git-dir=/Users/$USERNAME/.configuration/ --work-tree=/Users/$USERNAME'

# pnpm shortcut
alias pn=pnpm

# pnpm
export PNPM_HOME="/Users/moritz.behnke/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# fnm
eval "$(fnm env)"

# thefuck
eval $(thefuck --alias)

# direnv
eval "$(direnv hook zsh)"

# has to be installed seperately and needs powerline fonts (chage to fira in iterm settings)
ZSH_THEME="spaceship"

# don't wirte shortcut comands to history file (still kept in session history)
HISTORY_IGNORE="(z|fe|cdi|fh|fbr|fstash|fkill|bip|bup)"

plugins=(
    z
    git
    node
    bundler
    macos
    zsh-autosuggestions #has to be installed seperately
    zsh-syntax-highlighting #has to be installed seperately
    screen
)

source $ZSH/oh-my-zsh.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

unalias z 2> /dev/null
z() {
    [ $# -gt 0 ] && zshz "$*" && return
    cd "$(zshz -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

cdi() {
    if [[ "$#" != 0 ]]; then
        builtin cd "$@";
        return
    fi
    while true; do
        local lsd=$(ls -pa | grep '/$' | sed 's;/$;;')
        local dir="$(printf '%s\n' "${lsd[@]}" |
            fzf --reverse --preview '
                __cd_nxt="$(echo {})";
                __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
                echo $__cd_path;
                echo;
                ls -p -FG "${__cd_path}";
        ')"
        [[ ${#dir} != 0 ]] || return 0
        builtin cd "$dir" &> /dev/null
    done
}

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}
