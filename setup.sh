#!/bin/sh
# vim: foldmethod=marker tabstop=4 softtabstop=4 shiftwidth=4 syntax=sh filetype=sh

# Global Variables {{{

USERNAME="$(logname)"
UID_TEMP="$(id -u)"
GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

# }}}

# Warn Function {{{

warn() {
	local YELLOW="\033[0;33m"
	local RESET="\033[0m"
	printf "${YELLOW}%s${RESET}\n" "$*" >&2
	unset YELLOW RESET

}

# }}}

if [ "${UID_TEMP}" -eq 0 ];then
	printf "${GREEN}"
	mkdir -p -v "/home/$USERNAME/.lsws/" "/home/$USERNAME/.lsws/config/" "/home/$USERNAME/.lsws/logs/"
	printf "${RESET}"

	if [ ! -e /usr/local/man/man1/ ];then
		warn "/usr/local/man/man1/ directory does not exists." "Creating..."
		mkdir -v /usr/local/man/man1/
	fi

	if [ -f "./lsws.1.gz" ]; then
		printf "${GREEN}"
		mv -v ./lsws.1.gz /usr/local/man/man1/
		printf "${RESET}"

	else
		warn "./lsws.1.gz does not exists."

	fi

	if [ -f "./lsws.1" ]; then
		printf "${GREEN}"
		mv -v ./lsws.1 /usr/local/man/man1/
		printf "${RESET}"

	else
		warn "./lsws.1 does not exists."

	fi

	if [ -d "/home/$USERNAME/.lsws/" -a -d "/home/$USERNAME/.lsws/config/" \
			-a -d "/home/$USERNAME/.lsws/logs/" ]; then
		if [ -f "./lsws.defaults" ]; then
			printf "${GREEN}"
			mv -v ./lsws.defaults "/home/${USERNAME}/.lsws/config/"
			printf "${RESET}"

		else
			warn "./lsws.defaults does not exists."

		fi

		printf "${GREEN}"
		touch ./Seasonal.defaults
		mv -v ./Seasonal.defaults "/home/${USERNAME}/.lsws/config/"
		printf "${RESET}"
		chown -R $USERNAME /home/${USERNAME}/.lsws
	fi
else
	printf "${RED}This script should run with root privilege${RESET}\n"
fi

unset USERNAME UID_TEMP GREEN RED RESET
