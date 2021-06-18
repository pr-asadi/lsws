#!/bin/sh
USERNAME=$(logname)
UID_TEMP=$(id -u "${USERNAME}")

if [ "${UID_TEMP}" -eq 0 ]; then
	rm -v /usr/local/man/man1/lsws.1 /usr/local/man/man1/lsws.1.gz
else
	printf "\033[0;31mRun with sudo\033[0m\n"
	exit 1
fi

if [ -d "/home/${USERNAME}/.lsws" ]; then
	rm -rf "/home/${USERNAME}/.lsws/"

fi

if [ -d "/home/${USERNAME}/lsws/" ]; then
	rm -rf "/home/${USERNAME}/lsws/"
fi
