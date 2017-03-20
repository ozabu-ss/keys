# Path to your oh-my-zsh configuration.
ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="mh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

alias grep="/bin/grep --color=auto"

autoload -U compinit promptinit
compinit
promptinit

alias ls="ls --color -la1h "
alias history="fc -f -n -l 1"
alias diff="diff --side-by-side --suppress-common-lines -W240"
alias pp='python2 -mjson.tool'
alias s='sudo zsh'

function git_prompt_info() {
ref=$(git symbolic-ref HEAD 2> /dev/null) || return
echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
} 

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="white"; fi

PROMPT='[%{$fg[$NCOLOR]%}%B%n%b%{$reset_color%}@%{$fg[green]%}%B%m%b%{$reset_color%}:%{$fg[$NCOLOR]%}%30<...<%~%<<%{$reset_color%}]%(!.#.$) '
