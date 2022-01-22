#!/bin/bash


# ------------------- ** Custom aliases with description ** ---------------
# aliases and functions are put into .bashrc to ensure that these are loaded every time a shell is launched from within the existing environment.
alias sourcebrc=". ~/.bashrc";

# reload bash_profile without restarting/rebooting the user
alias sourcebp=". ~/.bash_profile";

# edit bashrc, bash_profile, gitconfig
alias codebrc="code ~/.bashrc";
alias codebp="code ~/.bash_profile";
alias codegc="code ~/.gitconfig";


# git aliases
alias glc="git log -1";

# linux shortcut commands
alias ll="ls -1a";
alias ..="cd ../";
alias ..l="cd ../ && ll";

# npm aliases
alias ni="npm install";
alias nu="npm uninstall"

# ----------------- / PROMPT SCRIPT \---------------

# Prompt stuff

export TERM=xterm-256color;
GREEN=$(tput setaf 84);
YELLOW=$(tput setaf 229); #229
PINK=$(tput setaf 217)
RESET=$(tput setaf 252);
WHITE=$(tput setaf 7);
BOLD=$(tput bold);

function git_branch_with_parenthesis {
  # Shows the current branch if in a git repository
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \(\1\)/';
}

function random_element {
  declare -a array=("$@")
  r=$((RANDOM % ${#array[@]}))
  printf "%s\n" "${array[$r]}"
}

# Default Prompt
function setEmoji {
  EMOJI="$*"
  DISPLAY_DIR='$(dirs)'
  # DISPLAY_USER='$(whoami)'
  DISPLAY_BRANCH='$(git_branch_with_parenthesis)'
  # setting prompt value here
  PS1="\`if [ \$? = 0 ]; then echo 🌈; else echo 🔥; fi\` ${PINK}\h: ${YELLOW}${DISPLAY_DIR}${GREEN}${DISPLAY_BRANCH}${RESET} ${EMOJI}"$'\n'"$ ";
}

function newRandomEmoji {
  setEmoji "$(random_element 😅 👽 🔥 🚀 👻 ⛄ 👾 🍔 💯 🍕 🍟 🍁 ⚡ 🌟 ✔ ✨ 😄 🍰 🤩 😎 🏎 🤖 😇 😼 💪 😛 🥓 🌮 🎉 💯 🔱)"
}

newRandomEmoji
export PS1;
# -------------------------------------------------------------
