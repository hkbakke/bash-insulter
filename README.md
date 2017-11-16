# bash-insulter
Insults the user when typing wrong command. Change insults as needed :)

Put `bash.command-not-found` in /etc and source it from `/etc/bash.bashrc`:
```
if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi
```
