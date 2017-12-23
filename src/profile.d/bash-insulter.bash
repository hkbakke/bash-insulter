# Whether or not to globally enable bash-insulter
# 0 = disabled
# anything else = enabled
GLOBAL_BASH_INSULTER=0

if [ -z "${GLOBAL_BASH_INSULTER}" ]; then
	echo "GLOBAL_BASH_INSULTER unset. Please edit /etc/profile.d/bash-insulter.sh"
	echo "and include one of the following at the top of the file:"
	echo ""
	echo "GLOBAL_BASH_INSULTER=0"
	echo "GLOBAL_BASH_INSULTER=1"
elif [ "${GLOBAL_BASH_INSULTER}" -ne 0 ]; then
	[ -f /etc/bash.command-not-found-messages ] && . /etc/bash.command-not-found-messages
	[ -f /etc/bash.command-not-found ] && . /etc/bash.command-not-found
fi