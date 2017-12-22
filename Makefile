SYSCONFDIR ?= /etc/

all:
	@echo Nothing to compile. To install to ${SYSCONFDIR} , type:
	@echo
	@echo make install
	@echo
	@echo To override the default install location, type:
	@echo
	@echo make SYSCONFDIR=/desired/install/path/here install

install:
	install -g root -o root -m 0444 -v src/bash.command-not-found ${SYSCONFDIR}/bash.command-not-found

remove:
	rm -fv ${SYSCONFDIR}/bash.command-not-found

uninstall: remove