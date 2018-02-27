# This requires either bash or zsh to function.
# Set your favorite to 1 to add a dependency for it.
%define bash 1
%define zsh 1

Name:		bash-insulter
Summary:	Insults you when you type a wrong command
License:	MIT
URL:		https://github.com/ItchyBugReporter/bash-insulter
Group:		Shells/Games
Version:	0.0
Release:	2

BuildArch:	noarch

%if %bash
Requires:	/bin/bash
%endif
%if %zsh
Requires:	/bin/zsh
%endif

# bash-insulter needs at least some sort of shell.
# Although I haven't tested it, it *should* work
# with anything POSIX-compliant. This is here as a
# "just-in-case" measure in case both of the above
# are false.
Requires:	/bin/sh

Source0:	%{name}-%{version}.tar.xz

%description
bash-insulter insults you whenever you type a command that does not exist
on your system. It will work from bash or zsh.

%prep
%setup -q -n %{name}

%build
# Nothing to compile

%install
rm -rf $RPM_BUILD_ROOT

make install DESTDIR="$RPM_BUILD_ROOT"

%clean
rm -rf $RPM_BUILD_ROOT $RPM_BUILD_DIR/%{name}-%{version}

%files
%defattr(-,root,root,-)
%config(noreplace) %{_sysconfdir}/bash.command-not-found-messages
%config(noreplace) %{_sysconfdir}/profile.d/bash-insulter.sh
# This is the actual script, hence why it isn't marked as
# %%config(noreplace)
%{_sysconfdir}/bash.command-not-found

%changelog
* Fri Feb 16 2018 Kristopher Gamrat <piki@retrolinux.org> - 0.0-2
- Initial RPM
