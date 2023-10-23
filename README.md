# My Dot files

Files and path in this repository are relativ to the `$HOME` directory. However, I suggest not to clone this repository into your `$HOME` but in a workspace directory instead, and pick the files / directory you need by :

- create link (sym or hard)
- copy the file

Some files are "samples" files, which mean you can not use them directly, but need to copy them and changes few things inside the file (personnal information) before using it.


# System configuration

## Git Config

> Sample file: `.gitconfig.sample`.

Just copy the file in your `$HOME/.gitconfig` and edit with your configuration

## Konsole

I'm using KDE and konsole as a terminal client.

> Configuration directory: `.local/share/konsole`

I've setup 2 custom profiles to use with konsole when I connect to a remote server
- a **Preprod** profile (with blue background) when I connect to a preprod/staging/testing server
- a **Prod** profile (with red background) when I connect to a production server

![Konsole with Prod profile](https://user-images.githubusercontent.com/2981531/276862750-62e96611-136d-4daa-8f03-4d26850c12f4.png)
![Konsole with Preprod profile](https://user-images.githubusercontent.com/2981531/276862755-e843c07c-7c3a-4c60-b104-29897037f69a.png)

With this profiles I always know on what kind of server I'm working on, and security measure I need to take.

Profiles can be activated by a command line option `/usr/bin/konsole --profile=Prod` or `/usr/bin/konsole --profile=Preprod`

Then I usually configure launcher script to connect to my remote server like this:
```bash
/usr/bin/konsole --profile=Prod -e 'ssh -t my-remote-server '\''exec bash'\'''
```

And I can setup a desktop launcher like this
```ini
[Desktop Entry]
Comment=SSH Connexion to my-remote-server
Exec=/usr/bin/konsole --profile=Prod -e 'ssh -t my-remote-server '\\''exec bash'\\'''
GenericName=My Remote Server
Icon=bash
Name=My Remote Server
StartupNotify=true
Terminal=false
Type=Application
```

## SSH Config

> Configuration directory : `.ssh/`

I'm using 2 subdirectories :
- `.ssh/config.d/`: Include files for remote server connexion configuration
- `.ssh/keys/`: SSH keys used to connect to this servers

There is a root config file with global options at `.ssh/config`

You will find a sample file for git repositories at [`.ssh/config.d/git.config.sample`](/.ssh/config.d/git.config.sample)

## Zsh and .oh-my-zsh

I'm using `zsh` has default shell, upgraded with [`oh-my-zsh`](https://ohmyz.sh/), [NerdFonts](https://www.nerdfonts.com/) and [Powerlevel10k](https://github.com/romkatv/powerlevel10k)

Then I added some custom configuration and aliases loaded by zsh when a new terminal is open. Custom configuration file should be located in your `$HOME/.oh-my-zsh/custom/` directory.

Here I share with you my configuration files

> Configuration directory:  [`.oh-my-zsh/custom/`](/.oh-my-zsh/custom/)
>
> Powerlevel10k: [`.p10k.zsh`](/.p10k.zsh)
>
> ZSH: [`.zshrc`](/.zshrc)clear

![Prompt screen shot](https://user-images.githubusercontent.com/2981531/277294265-012c3cd5-b47b-4479-80ab-711264f38e69.png)

# Applications

## CLI Visualizer

Command line visualizer. Supports mpd, with experimental support for alsa and pulseaudio.

Project available on github: [dpayne/cli-visualizer](https://github.com/dpayne/cli-visualizer)

> Configuration directory: [`.config/vis/`](/.config/vis/)

## LazyGit

Lazygit is a usefull tool to manage your git project with the terminal

Project documentation: [jesseduffield/lazygit](https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md)

This custom configuration file require [NerdFonts](https://www.nerdfonts.com/) to be installed (My prefered one is Hack Nerd Font)

> Configuration file: [`.config/lazygit/config.yml`](/.config/lazygit/config.yml)


## Midnight Commander

Project documentation: [MidnightCommander/mc](https://github.com/MidnightCommander/mc)

> Configuration directory: [`.config/mc/`](.config/mc/)
