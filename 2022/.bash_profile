# load bashrc script when .bash_profile loaded first time when we logged into the system.
# on every interactive login shell, bashrc script will be executed
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Generally, environment variables are put into .bash_profile. Since the interactive login shell is the first shell, all the default settings required for the environment setup are put in .bash_profile.
