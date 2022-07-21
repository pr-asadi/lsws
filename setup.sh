#!/bin/sh
# vim: tabstop=4 softtabstop=4 shiftwidth=4 syntax=sh filetype=sh
# 

# Global Variables
# 
USERNAME="$(logname)"
LSWS_PATH="/home/${USERNAME}/.lsws"
LSWS_CONF="${LSWS_PATH}/config"
LSWS_LOGS="${LSWS_PATH}/logs"
UID_TEMP="$(id -u)"
GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

# Warn function
#
warn() {
	local YELLOW="\033[0;33m"
	printf "$0: ${YELLOW}%s${RESET}\n" "$*" >&2
	unset YELLOW

}

# Help function
# 
show_help() {
	printf "$0: %s\t%s" "-m" "Copy man page" >&2
	printf " %s\n" "to /usr/local/man/man1" >&2
	printf "\t\t%s\n\n" "or /usr/share/man/man1" >&2
	printf "\t  %s\t%s\n" "-h" "Show help" >&2
}

# Doc install function
# 
doc_install() {
	if [ "$UID_TEMP" -eq 0 ]; then
		if [ -e "/usr/local/man/man1" ]; then
			mv -v "./lsws.1" "/usr/local/man/man1/"

		elif [ -e "/usr/share/man/man1" ]; then
			mv -v "./lsws.1" "/usr/share/man/man1/"
		else
			warn "Neither /usr/local/man/man1 exists, nor /usr/share/man/man1"
			exit 1
		fi
	else
		warn "-m:" "this flag needs root privilege. Use sudo or doas."
		exit 1
	fi
}

# Main function
#
main() {
	if [ ! -e "$LSWS_PATH" ]; then
		mkdir -v "$LSWS_PATH"
	fi

	if [ ! -e "$LSWS_CONF" ]; then
		mkdir -v "$LSWS_CONF"
	fi

	if [ ! -e "$LSWS_LOGS" ]; then
		mkdir -v "$LSWS_LOGS"
	fi
	

	cp -iv "./lsws.defaults" "$LSWS_CONF/"
	touch "${LSWS_CONF}/Seasonal.defaults"
	touch "${LSWS_LOGS}/current_wallpaper"
	touch "${LSWS_LOGS}/wallpaper_logs"
	touch "${LSWS_LOGS}/wallpaper_res_logs"

}

case "$1" in
	'-h')
		show_help
		exit 1
		;;
	'-m')
		doc_install
		;;
	'')
		main
		;;
esac

unset USERNAME LSWS_PATH LSWS_CONF LSWS_LOGS UID_TEMP GREEN RED RESET
