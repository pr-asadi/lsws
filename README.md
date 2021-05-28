# lsws
A simple wrapper for setting background with wallpaper setter tools.

## Features
- Set wallpaper every X minutes
- Set X wallpaper from  begin/end of the history file
- Restore previous wallpaper from history file
- Seasonal wallpapers

## Installation
```
$ git clone https://github.com/Dark-Rail/lsws.git
$ cd lsws
$ sudo sh setup.sh
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
