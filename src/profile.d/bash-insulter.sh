# Whether or not to globally enable bash-insulter
# 0 = disabled
# 1 = enabled
GLOBAL_BASH_INSULTER=0

# If GLOBAL_BASH_INSULTER is unset...
if [ -z "${GLOBAL_BASH_INSULTER}" ]; then
	# ...assume it should be disabled
	GLOBAL_BASH_INSULTER=0
fi

# This script tests for numeric equality, so let's enforce that
if [ "${GLOBAL_BASH_INSULTER}" = "true" ]; then
	GLOBAL_BASH_INSULTER=1
fi
if [ "${GLOBAL_BASH_INSULTER}" = "false" ]; then
	GLOBAL_BASH_INSULTER=0
fi

# Whew... now that we're through all the crazy "let's figure
# out what the user mean" stuff, let's figure out whether or
# not to actually *enable* bash-insulter
if [ "${GLOBAL_BASH_INSULTER}" -gt 0 ]; then
	[ -f /etc/bash.command-not-found-messages ] && . /etc/bash.command-not-found-messages
	[ -f /etc/bash.command-not-found ] && . /etc/bash.command-not-found
fi