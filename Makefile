SYSCONFDIR ?= /etc/

all:
	@echo Nothing to compile. To install to ${SYSCONFDIR} , type:
	@echo
	@echo make install
	@echo
	@echo To install somewhere else, type:
	@echo
	@echo make SYSCONFDIR=/desired/install/path/here install

# Yes, I intended to use commas instead of slashes as the delimiter for
# the sed substitution. This is to avoid issues with the usual forward-
# slash normally used in sed and always used in Unix-style paths.
install:
	install -g root -o root -m 0444 -v src/bash.command-not-found ${SYSCONFDIR}/bash.command-not-found
	[ -f src/bash.command-not-found-messages ] && install -g root -o root -m 0444 -v src/bash.command-not-found-messages ${SYSCONFDIR}/bash.command-not-found-messages
	[ ! -d ${SYSCONFDIR}/profile.d ] && install -d -g root -o root -m0755 -v ${SYSCONFDIR}/profile.d
ifeq ($(SYSCONFDIR),"/etc/")
	install -g root -o root -m0755 -v src/profile.d/bash-insulter.sh ${SYSCONFDIR}/profile.d/bash-insulter.sh
else
	sed s,/etc/,${SYSCONFDIR}, src/profile.d/bash-insulter.sh > src/bash-insulter-new-sysconfdir.sh
	install -g root -o root -m0755 -v src/profile.d/bash-installer-new-sysconfdir.sh ${SYSCONFDIR}/profile.d/bash-insulter.sh
endif

remove:
	rm -fv ${SYSCONFDIR}/bash.command-not-found
	[ -f ${SYSCONFDIR}/bash.command-not-found-messages ] && rm -fv ${SYSCONFDIR}/bash.command-not-found-messages
	[ -f ${SYSCONFDIR}/profile.d/bash-insulter.sh ] && rm -fv ${SYSCONFDIR}/profile.d/bash-insulter.sh

uninstall: remove