#	Project: Shell-Functions.
#	init.sh	--	Initialises configurations.
#	Revisions:
#	2018-11-15	--	F.R. van der Meulen	--	Created.

#   Import scripts.
basedir=$(dirname $BASH_SOURCE)
source "${basedir}/texteffects.sh"
source "${basedir}/configs.sh"

#	Display configs.
command echo -e "${TXTLIGHTMAGENTA}---Shell-Functions Lib Configs---${RESETALL}"
command echo -e "${TXTLIGHTCYAN}Base directory: ${TXTLIGHTYELLOW}${basedir}${RESETALL}"
command echo -e "${TXTLIGHTCYAN}Project directory: ${TXTLIGHTYELLOW}${projdir}${RESETALL}"

#	If project directory is not configured.
if [[ ${projdir} == "" ]]; then
	#	Notify user.
	command echo ""
	command echo -e "${TXTLIGHTRED}Project directory not defined!${RESETALL}"
	command echo -e "${TXTLIGHTCYAN}Please enter your projects directory!${RESETALL}"
	command echo -e "${RESETALL}Example: ${TXTLIGHTYELLOW}~/Documents/Projects${RESETALL}"
	
	#	Read user-defined projects folder.
	read userdir

	#	Process input.
	tmpprojdir="${userdir/'~'/${homedir}}"
	cfgline="projdir=${tmpprojdir}"
	
	#	If directory does not exist.
	if [[ ! -d $tmpprojdir ]]; then
		#	Make directory.
		mkdir "${tmpprojdir}"
	fi

	#	Replace variable in configs.
	sed -i "12s|.*|$cfgline|g" "${basedir}/configs.sh"
	
	#	Notify user.
	command echo -e "${TXTLIGHTYELLOW}Projects directory set to: ${RESETALL}${tmpprojdir}."
fi