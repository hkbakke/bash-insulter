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

    # Install Method 1 - 'make install'
    git clone https://github.com/hkbakke/bash-insulter.git bash-insulter
    cd bash-insulter
    sudo make install
    
    # Install Method 2 - Manually (I know what I am doing!)
    git clone https://github.com/hkbakke/bash-insulter.git bash-insulter
    sudo cp bash-insulter/src/bash.command-not-found /etc/
    sudo cp bash-insulter/src/bash.command-not-found-messages /etc/
    sudo cp bash-insulter/src/profile.d/bash-insulter.sh /etc/profile.d/bash-insulter.sh

    # Install Method 3 - Manually (I don't care, insult me!)
    sudo wget -O /etc/bash.command-not-found https://raw.githubusercontent.com/hkbakke/bash-insulter/master/src/bash.command-not-found
    sudo wget -O /etc/bash.command-not-found-messages https://raw.githubusercontent.com/hkbakke/bash-insulter/master/src/bash.command-not-found-messages
    sudo wget -O /etc/profile.d/bash-insulter.sh https://raw.githubusercontent.com/hkbakke/bash-insulter/master/src/profile.d/bash-insulter.sh

Then you can enable bash-insulter one of three ways:

    # Enable Method 1 - Enable globally via profile.d
    Edit /etc/profile.d/bash-insulter.sh and set GLOBAL_BASH_INSULTER=1

    # Enable Method 2 - Enable globally via /etc conf file
    Edit your shells global config file (/etc/bashrc , /etc/zshrc , etc.) to add the following to the end:
    if [ -f /etc/bash.command-not-found-messages ]; then
        . /etc/bash.command-not-found-messages
    fi
    if [ -f /etc/bash.command-not-found ]; then
        . /etc/bash.command-not-found
    fi

    # Enable Method 3 - Enable for one user
    Edit your personal shell config (~/.bashrc , ~/.zshrc , ~/.profile , etc.) then add the following to the end:
    if [ -f /etc/bash.command-not-found ]; then
        . /etc/bash.command-not-found
    fi

After you enable bash-insulter, logout then login again and type some invalid commands for the effects to be visible.

# Configuration
bash-insulter can be customized, or even be made polite and nice, by populating `CMD_NOT_FOUND_MSGS` or `CMD_NOT_FOUND_MSGS_APPEND` environment variables. The values should be arrays. `CMD_NOT_FOUND_MSGS` replaces the default messages, while `CMD_NOT_FOUND_MSGS_APPEND` appends more messages to the existing ones.

It is probably cleanest to source a file populating the environment variable as needed. In this example I create a file `/etc/bash.command-not-found-messages` with the following content:

    CMD_NOT_FOUND_MSGS=(
        "You are so smart!"
        "You look pretty today!"
        "I don't know what to say"
    )
    
Then source this file before you source the script (if you haven't done so already):
```
if [ -f /etc/bash.command-not-found-messages ]; then
    . /etc/bash.command-not-found-messages
fi

if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi
```

Then logout and in again. The end result is that you will now use your messages instead of the default ones.
