# lsws
a simple wrapper for setting wallpaper with wallpaper setter tool.

## Features
- Set wallpaper every X minutes
- Set X wallpaper from  begin/end of the history file
- Restore previous wallpaper from history file
- Seasonal wallpapers

## Installation
```
$ git clone https://github.com/pr-asadi/lsws.git
$ cd lsws
$ sh setup.sh
```
To install man page, execute:
```
$ sudo sh setup.sh -m
```
And for help:
```
$ sh setup.sh -h
```

## Configuration
To use `lsws`, you may want to change `~/.lsws/lsws.defaults` variables:
1. `DIRECTORY`: Default wallpapers directory
2. `APP`: Default program to set background
3. `APP_FLAG`: Default `APP` options

## Help
```
$ man 1 lsws
```

## Uninstallation
```
$ cd lsws
$ sudo sh uninstall.sh
```
