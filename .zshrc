#!/bin/zsh

# Autocompletion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# Colors.
autoload -U colors && colors
setopt promptsubst

# Git prompt
setup_git_prompt() {
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    git_prompt=""
    return 0
  fi

  local git_status_dirty git_branch

  if [ "$(git --no-optional-locks status --untracked-files='no' --porcelain)" ]; then
    git_status_dirty='%F{red}*'
  else
    unset git_status_dirty
  fi

  git_branch="$(git symbolic-ref HEAD 2>/dev/null)"
  git_branch="${git_branch#refs/heads/}"

  git_branch="${git_branch:-no branch}"
  git_prompt=" (%F{green}${git_branch}${git_status_dirty}%f)"
}

precmd() {
  echo -en $"\e]2;$PWD\a"
  setup_git_prompt
}

preexec() {
  printf "\033]0;%s\a" "$1"
}

PROMPT='[%B%F{green}$USER@%m %c%b%f]${git_prompt} '

# Home row bindings: common
bindkey "\033[3~" delete-char

# Home row bindings: Pure zsh
bindkey "\033[H" beginning-of-line
bindkey "\033[F" end-of-line

# Home row bindings: zsh inside tmux
bindkey "\033[1~" beginning-of-line
bindkey "\033[4~" end-of-line

# Load profile
source ~/.profile

