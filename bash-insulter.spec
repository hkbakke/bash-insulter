Name:		bash-insulter
Summary:	Insults you when you type a wrong command
License:	MIT
URL:		https://github.com/ItchyBugReporter/bash-insulter
Group:		Shells/Games
Version:	0.0
Release:	1

Requires:	/bin/bash
Requires:	/bin/zsh

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
%{_sysconfdir}/bash.command-not-found
%config(noreplace) %{_sysconfdir}/bash.command-not-found-messages
%config(noreplace) %{_sysconfdir}/profile.d/bash-insulter.sh

%changelog
* Fri Feb 16 2018 Kristopher Gamrat <piki@retrolinux.org> - 0.0-1
- Initial RPM
