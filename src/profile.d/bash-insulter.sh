# Whether or not to globally enable bash-insulter
# 0 = disabled
# anything else = enabled
GLOBAL=1

if [ "${GLOBAL}" -ne 0 ]
then
	[ -f /etc/bash.command-not-found-messages ] && . /etc/bash.command-not-found-messages
	[ -f /etc/bash.command-not-found ] && . /etc/bash.command-not-found
fi