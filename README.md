# bash-insulter
Randomly insults the user when typing wrong command.

Change insults as needed :)

# Installation

    git clone https://github.com/hkbakke/bash-insulter.git
    sudo cp src/bash.command-not-found /etc/bash.command-not-found

Then source the file automatically for new logins by adding the following to `/etc/bash.bashrc`:
```
if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi
```
Login again and type some invalid commands for the effects to be visible.
