#PROMPT COLOR STUFF
green=$(tput setaf 2);
yellow=$(tput setaf 3);
orange=$(tput setaf 166);
red=$(tput setaf 124);
violet=$(tput setaf 61);
white=$(tput setaf 7);
reset=$(tput sgr0);
bold=$(tput bold);

# Checking if user is root or not
if [[ "${USER}" == "root" ]]; then
	userStyle="${red}";
else
	userStyle="${orange}";
fi;

# Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
	hostStyle="${bold}${red}";
else
	hostStyle="${yellow}";
fi;

# This function is for displaying current branch
git_branch() {
  git_branch=$(git branch --show-current 2> /dev/null)
  if [[ $git_branch == "" ]];then
    echo -e "${white}but sadly, ❌${green} this is not a git repo ❌" 
  else
    echo -e "${white}and on${green} ⚡ $git_branch ⚡ ${white} branch"
  fi
}

rand() {
  printf $((  $1 *  RANDOM  / 32767   ))
}

rand_element () {
  local -a th=("$@")
  unset th[0]
  printf $'%s\n' "${th[$(($(rand "${#th[*]}")+1))]}"
}

EMOJI="$(rand_element 😅 🔥 🚀 👻 ⛄ 🍔 😄 🍰 😎 💪 🥓 🌮 🎉 💯 🍕 🍟 🍁 ⚡ 🌟 ✔ ✨)"

#Default Prompt
PS1="\[${bold}\]\n"; 
PS1+="\[${userStyle}\]\u"; 
PS1+="\[${white}\] is in";
PS1+=" ${bold}${yellow}\W ${white}${bold}dir ${green}${bold}$(git_branch)";
PS1+="\n";
PS1+="\[${white}\]\[${EMOJI}\] \[${reset}\]";
