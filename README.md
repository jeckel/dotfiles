# dotfiles
My Dot files

Files and path in this repository are relativ to the `$HOME` directory. However, I suggest not to clone this repository into your `$HOME` but in a workspace directory instead, and pick the files / directory you need by :

- create link (sym or hard)
- copy the file

Some files are "samples" files, which mean you can not use them directly, but need to copy them and changes few things inside the file (personnal information) before using it.


# System configuration

## Git Config

Sample file `.gitconfig.sample`.

Just copy the file in your `$HOME/.gitconfig` and edit with your configuration

## SSH Config

Directory : `.ssh/`

I'm using 2 subdirectories :
- `.ssh/config.d/` : Include files for remote server connexion configuration
- `.ssh/keys/` : SSH keys used to connect to this servers

There is a root config file with global options at `.ssh/config`

You will find a sample file for git repositories at `.ssh/config.d/git.config.sample`

# Applications

## CLI Visualizer

Command line visualizer. Supports mpd, with experimental support for alsa and pulseaudio.

Project available on github : [dpayne/cli-visualizer](https://github.com/dpayne/cli-visualizer)

Configuration directory available at `.config/vis`

## Midnight Commander

Project documentation: [MidnightCommander/mc](https://github.com/MidnightCommander/mc)

Configuration directory : `.config/mc/`

