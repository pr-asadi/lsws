#!/bin/sh
# vim: foldmethod=marker tabstop=4 softtabstop=4 shiftwidth=4 syntax=sh filetype=sh

# Global Variables {{{

USERNAME=$(logname)
UID_TEMP=$(id -u)
RED="\033[0;31m"
GREEN="\033[0;32m"
RESET="\033[0m"
	
# }}}

# Warn Function {{{
warn() {
	local FILE_NAME="$0"
	local FILE_NAME="$(basename ${FILE_NAME})"
	local YELLOW="\033[0;33m"
	local RESET="\033[0m"
	printf "${FILE_NAME}: ${YELLOW}%s${RESET}\n" "$*" >&2
	unset YELLOW RESET FILE_NAME

}

# }}}

# Log Function {{{

log() {
	local FILE_NAME="$0"
	local FILE_NAME="$(basename ${FILE_NAME})"
	local GREEN="\033[0;32m"
	local RESET="\033[0m"
	printf "${FILE_NAME}: ${GREEN}%s${RESET}\n" "$*"
	unset GREEN RESET FILE_NAME

}

# }}}

if [ "${UID_TEMP}" -eq 0 ]; then

	if [ -d "/usr/local/man/man1/" ]; then

		if [ -f "/usr/local/man/man1/lsws.1" ]; then
			printf "${GREEN}"
			rm -v /usr/local/man/man1/lsws.1
			printf "${RESET}"
		else
			warn "/usr/local/man/man1/lsws.1 does not exists."
		fi

		if [ -f "/usr/local/man/man1/lsws.1.gz" ]; then
			printf "${GREEN}"
			rm -v /usr/local/man/man1/lsws.1.gz
			printf "${RESET}"
		else
			warn "/usr/local/man/man1/lsws.1.gz does not exists."
		fi

	fi
else
	printf "${RED}Run with sudo/doas${RESET}\n"
	exit 1
fi

if [ -d "/home/${USERNAME}/.lsws/" ]; then
	rm -rf "/home/${USERNAME}/.lsws/"
	log "/home/${USERNAME}/.lsws/ removed."
else
	warn "/home/${USERNAME}/.lsws/ does not exists."

fi

if [ -d "/home/${USERNAME}/lsws/" ]; then
	rm -rf "/home/${USERNAME}/lsws/"
	log "/home/${USERNAME}/lsws/ removed."
else
	warn "/home/${USERNAME}/lsws/ does not exists."
fi

unset UID_TEMP USERNAME RED RESET
