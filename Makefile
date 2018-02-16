SYSCONFDIR ?= /etc/
DESTDIR ?= 

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
ifneq ($(SYSCONFDIR),"/etc/")
	cp -v src/profile.d/bash-insulter.sh src/profile.d/bash-insulter-old.sh
	sed s,/etc/,${SYSCONFDIR}, src/profile.d/bash-insulter-old.sh > src/bash-insulter.sh
endif
	[ -d '${DESTDIR}${SYSCONFDIR}' ] || mkdir -pv '${DESTDIR}${SYSCONFDIR}'
	[ -d '${DESTDIR}${SYSCONFDIR}/profile.d/' ] || mkdir -pv '${DESTDIR}${SYSCONFDIR}profile.d/'
	install -m 0444 -v src/bash.command-not-found '${DESTDIR}${SYSCONFDIR}bash.command-not-found'
	install -m 0444 -v src/bash.command-not-found-messages '${DESTDIR}${SYSCONFDIR}bash.command-not-found-messages'
	install -m 0755 -v src/profile.d/bash-insulter.sh '${DESTDIR}${SYSCONFDIR}profile.d/bash-insulter.sh'

remove:
	rm -fv '${DESTDIR}/${SYSCONFDIR}/bash.command-not-found'
	rm -fv '${DESTDIR}/${SYSCONFDIR}/bash.command-not-found-messages'
	rm -fv '${SYSCONFDIR}/profile.d/bash-insulter.sh'

uninstall: remove
