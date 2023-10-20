# My Dot files

Files and path in this repository are relativ to the `$HOME` directory. However, I suggest not to clone this repository into your `$HOME` but in a workspace directory instead, and pick the files / directory you need by :

- create link (sym or hard)
- copy the file

Some files are "samples" files, which mean you can not use them directly, but need to copy them and changes few things inside the file (personnal information) before using it.


# System configuration

## Git Config

> Sample file `.gitconfig.sample`.

Just copy the file in your `$HOME/.gitconfig` and edit with your configuration

## Konsole

I'm using KDE and konsole as a terminal client.

> Configuration directory : `.local/share/konsole`

I've setup 2 custom profiles to use with konsole when I connect to a remote server
- a **Preprod** profile (with blue background) when I connect to a preprod/staging/testing server
- a **Prod** profile (with red background) when I connect to a production server

![Konsole with Prod profile](https://user-images.githubusercontent.com/2981531/276862750-62e96611-136d-4daa-8f03-4d26850c12f4.png)
![Konsole with Preprod profile](https://user-images.githubusercontent.com/2981531/276862755-e843c07c-7c3a-4c60-b104-29897037f69a.png)

With this profiles I always know on what kind of server I'm working on, and security measure I need to take.

Profiles can be activated by a command line option `/usr/bin/konsole --profile=Prod` or `/usr/bin/konsole --profile=Preprod`

Then I usually configure launcher script to connect to my remote server like this :
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
- `.ssh/config.d/` : Include files for remote server connexion configuration
- `.ssh/keys/` : SSH keys used to connect to this servers

There is a root config file with global options at `.ssh/config`

You will find a sample file for git repositories at `.ssh/config.d/git.config.sample`

# Applications

## CLI Visualizer

Command line visualizer. Supports mpd, with experimental support for alsa and pulseaudio.

Project available on github : [dpayne/cli-visualizer](https://github.com/dpayne/cli-visualizer)

> Configuration directory : `.config/vis`

## Midnight Commander

Project documentation: [MidnightCommander/mc](https://github.com/MidnightCommander/mc)

> Configuration directory : `.config/mc/`
