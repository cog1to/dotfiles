#
# ~/.bashrc
# Loads once for each interactive shell.
#

# Color constants
BOLD_RED="\[\033[01;31m\]"
BOLD_GREEN="\[\033[01;32m\]"
BOLD_YELLOW="\[\033[01;33m\]"
BOLD_AMBER="\[\033[38;5;208m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
CLEAR="\[\033[00m\]"

# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Git branch & dirty status for prompt.
# Taken with some modifications from https://gist.github.com/matthewmccullough/47267.
git_prompt() {
  # If not in git dir, abort.
  git rev-parse --git-dir &> /dev/null

  local git_status="$(git status 2> /dev/null)"
  local branch_pattern="^On branch ([^${IFS}]*)"

  # Dirty state.
  if [[ ${git_status} =~ "nothing added to commit but untracked files present" ]]; then
    state="${RED}?"
  elif [[ ! ${git_status} =~ "working tree clean" ]]; then
    state="${RED}*"
  fi

  # Branch name.
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    local branch=${BASH_REMATCH[1]}
    echo " ${CLEAR}(${GREEN}${branch}${state}${CLEAR})"
  fi
}

# Git branch completion.
# See https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html
# for a good explanation of different `compgen` and `complete` options.
git_branch() {
  # If not in git dir, abort.
  git rev-parse --git-dir &> /dev/null

  local command=${COMP_WORDS[1]}
  if [[ ${command} == "checkout" || ${command} == "branch" ]]; then
    # `sed` deletes leading symbols from `git branch` output
    # so "* current_branch" becomes "current_branch".
    local branches=`git branch --no-color | sed -e 's/[\* ] //'`
    COMPREPLY=( $(compgen -W "${branches}" -- ${COMP_WORDS[$COMP_CWORD]}) )
  fi
}
complete -o default -F git_branch git

# Prompt customization goes here.
prompt() {
  GIT_PROMPT=$(git_prompt)
  # The arrow in the prompt below is a unicode symbol, so in a pure console
  # environment it will display as a red square. Replace it with a simple
  # angled bracket for uniform look and feel.
  # ------------------------------------------------------------------------
  # Quick cheatsheet for built-in aliases:
  #   \u - username
  #   \h - hostname up to first '.'
  #   \W - directory name (last path component)
  #   \t - current time
  # Full list is at `man bash`.
  # A good guide for customizing the prompt: 
  #   https://tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html
  PS1="${BOLD_GREEN}\W${GIT_PROMPT}${CLEAR}${BOLD_RED} ➤${CLEAR} "
}
PROMPT_COMMAND=prompt

# Enable VI mode.
set -o vi
export VISUAL=vim

# Profile variables and data.
source ~/.profile
