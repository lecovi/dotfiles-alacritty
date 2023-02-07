# dotfiles-alacritty

My Alacritty configuration file

## Installation

Run [`install.sh`](../blob/main/install.sh) script to install the configuration file.

```bash
$ ./install.sh
```

or follow the steps below to install manually:

Create a symlink (or copy) `alacritty.yml` to your directory:

```bash
~/.config/alacritty $ ln -s config/alacritty/alacritty.yml
```
Copy `font/` content into your `~/.fonts` directory.
Create `~/.fonts/` if doesn't exists.

```bash
$ cp fonts/* ~/.fonts/
```

Reload Alacritty and enjoy!
