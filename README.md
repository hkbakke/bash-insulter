# bash-insulter
Randomly insults the user when typing wrong command.

Change insults as needed :)

```bash
noob@bender:~ $ sl

  Y u no speak computer???

-bash: sl: command not found
noob@bender:~ $ gti status

  This is why nobody likes you.

-bash: gti: command not found
noob@bender:~ $ sp aux

  Go outside.

-bash: sp: command not found
```

# Installation

    git clone https://github.com/hkbakke/bash-insulter.git bash-insulter
    sudo cp bash-insulter/src/bash.command-not-found /etc/

Then source the file automatically for new logins by adding the following to `/etc/bash.bashrc`:
```
if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi
```
Login again and type some invalid commands for the effects to be visible.
