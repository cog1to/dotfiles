#
# ~/.bashrc
# Loads once for each interactive shell.
#

# Color constants
BOLD_RED="\[\033[01;31m\]"
BOLD_GREEN="\[\033[01;32m\]"
GREEN="\[\033[0;32m\]"
CLEAR="\[\033[00m\]"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Git branch & dirty status for prompt.
# Taken with some modifications from [matthewmccullough's gist](https://gist.github.com/matthewmccullough/47267)
git_prompt() {
  # If not in git dir, abort.
  git rev-parse --git-dir &> /dev/null

  git_status="$(git status 2> /dev/null)"
  branch_pattern="^On branch ([^${IFS}]*)"

  # Dirty state
  if [[ ! ${git_status} =~ "working tree clean" && ! ${git_status} =~ "nothing added to commit" ]]; then
    state=" ${BOLD_RED}*"
  fi

  # Branch name
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo " ${CLEAR}(${GREEN}${branch}${state}${CLEAR})"
  fi
}

# Prompt customization goes here.
prompt() {
  GIT_PROMPT=$(git_prompt)
  # The arrow in the prompt below is a unicode symbol, so in a pure console
  # environment it will display as a red square. Replace it with a simple
  # angled bracket for uniform look and feel.
  PS1="${CLEAR}[${BOLD_GREEN}\u@\h \W${GIT_PROMPT}${CLEAR}]${BOLD_RED}➤${CLEAR} "
}
PROMPT_COMMAND=prompt

# Enable VI mode
set -o vi
export VISUAL=vim

# Load profile
source ~/.profile
