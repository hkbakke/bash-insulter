# bash-insulter
Randomly insults the user when typing wrong command. Remember to either source the file or login again for the effects to be visible.

Change insults as needed :)

Put `bash.command-not-found` in /etc and source it from `/etc/bash.bashrc`:
```
if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi
```
