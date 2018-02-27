# Whether or not to globally enable bash-insulter
# 0 = disabled
# 1 = enabled
GLOBAL_BASH_INSULTER=0

if [ "${SHELL}" = "/bin/bash" -o "${SHELL}" = "/bin/zsh" ]; then

	# If GLOBAL_BASH_INSULTER is unset...
	if [ -z "${GLOBAL_BASH_INSULTER}" ]; then
		# ...assume it should be disabled
		GLOBAL_BASH_INSULTER=0
	fi

	if [ "${GLOBAL_BASH_INSULTER}" ]; then
		[ -f /etc/bash.command-not-found-messages ] && . /etc/bash.command-not-found-messages
		[ -f /etc/bash.command-not-found ] && . /etc/bash.command-not-found
	fi
fi
