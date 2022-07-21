#!/bin/sh
# vim: tabstop=4 softtabstop=4 shiftwidth=4 syntax=sh filetype=sh

# Global Variables
#
USERNAME="$(logname)"
LSWS_PATH="/home/${USERNAME}/.lsws"
LSWS_CONF="${LSWS_PATH}/config"
LSWS_LOGS="${LSWS_PATH}/logs"
UID_TEMP="$(id -u)"
RED="\033[0;31m"
GREEN="\033[0;32m"
RESET="\033[0m"
	
# Warn Function
# 
warn() {
	local FILE_NAME="$(basename $0)"
	local YELLOW="\033[0;33m"
	printf "${FILE_NAME}: ${YELLOW}%s${RESET}\n" "$*" >&2
	unset YELLOW FILE_NAME

}

# Log Function
#
log() {
	local FILE_NAME="$(basename $0)"
	printf "${FILE_NAME}: ${GREEN}%s${RESET}\n" "$*"
	unset FILE_NAME

}

if [ "${UID_TEMP}" -eq 0 ]; then

	if [ -d "/usr/local/man/man1" ]; then

		if [ -f "/usr/local/man/man1/lsws.1" ]; then
			printf "$GREEN"
			rm -v "/usr/local/man/man1/lsws.1"
			printf "$RESET"
		else
			warn "/usr/local/man/man1/lsws.1 does not exist."
		fi

	elif [ -d "/usr/share/man/man1" ]; then

		if [ -f "/usr/share/man/man1/lsws.1" ]; then
			printf "$GREEN"
			rm -v "/usr/share/man/man1/lsws.1"
			printf "$RESET"
		else
			warn "/usr/share/man/man1/lsws.1 does not exist."
		fi
	fi
else
	printf "${RED}Run with sudo/doas${RESET}\n"
	exit 1
fi

if [ -d "$LSWS_PATH" ]; then
	rm -rf "$LSWS_PATH"
	log "$LSWS_PATH removed."
else
	warn "$LSWS_PATH does not exist."

fi

unset UID_TEMP USERNAME RED RESET
