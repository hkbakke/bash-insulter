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

# Compatibility
* Bash v4 and newer
* Zsh

# Installation

    # Method 1 - know what you are doing
    git clone https://github.com/hkbakke/bash-insulter.git bash-insulter
    sudo cp bash-insulter/src/bash.command-not-found /etc/

    # Method 2 - I don't care, insult me!
    sudo wget -O /etc/bash.command-not-found https://raw.githubusercontent.com/hkbakke/bash-insulter/master/src/bash.command-not-found

Then source the file automatically for new logins by adding the following to `/etc/bash.bashrc` or any of the other locations where you can configure your shell automatically during login (zsh have different config files):
```
if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi
```
Login again and type some invalid commands for the effects to be visible.
