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
command echo -e "${TXTLIGHTCYAN}Text editor: ${TXTLIGHTYELLOW}${txteditor}${RESETALL}"
command echo -e "${TXTLIGHTCYAN}Web browser: ${TXTLIGHTYELLOW}${webbrowser}${RESETALL}"


#	If project directory is not configured.
if [[ ${projdir} == "" ]]; then
	#	Notify user.
	command echo ""
	command echo -e "${TXTLIGHTRED}Project directory not configured!${RESETALL}"
	command echo -e "${TXTLIGHTCYAN}Please enter your projects directory!${RESETALL}"
	command echo -e "${RESETALL}Example: ${TXTLIGHTYELLOW}~/Documents/Projects${RESETALL}"
	command printf "${TXTLIGHTCYAN}Directory path: ${RESETALL}"

	#	Read user-defined projects folder.
	read -r userdir

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
	command printf "${TXTLIGHTGREEN}Projects directory set to: '${RESETALL}"
	command printf "${TXTLIGHTYELLOW}${tmpprojdir}"
	command echo -e "${TXTLIGHTGREEN}'.${RESETALL}"
fi

#	If text editor is not configured.
if [[ ${txteditor} == "" ]]; then
	#	Notify user.
	command echo ""
	command echo -e "${TXTLIGHTRED}Text editor not configured!${RESETALL}"
	command echo -e "${TXTLIGHTCYAN}Please enter your favourite text editor command!${RESETALL}"
	command echo -e "${TXTLIGHTYELLOW}Examples:${RESETALL} nano, vim, subl, ..."
	command printf "${TXTLIGHTCYAN}Text editor command: ${RESETALL}"

	#	Read user-defined text editor command.
	read -r txteditorcommand

	#	Process input.
	cfgline="txteditor=${txteditorcommand}"

	#	Replace variable in configs.
	sed -i "14s|.*|$cfgline|g" "${basedir}/configs.sh"

	#	Notify user.
	command printf "${TXTLIGHTGREEN}Text editor set to: '${RESETALL}"
	command printf "${TXTLIGHTYELLOW}${txteditorcommand}${RESETALL}"
	command echo -e "${TXTLIGHTGREEN}'.${RESETALL}"
fi

#	If web browser is not configured.
if [[ ${webbrowser} == "" ]]; then
	#	Notify user.
	command echo ""
	command echo -e "${TXTLIGHTRED}Web browser not configured!${RESETALL}"
	command echo -e "${TXTLIGHTCYAN}Please enter your favourite web browser command!${RESETALL}"
	command echo -e "${TXTLIGHTYELLOW}Examples:${RESETALL} firefox, google-chrome, ..."
	command printf "${TXTLIGHTCYAN}Web browser command: ${RESETALL}"

	#	Read user-defined web browser command.
	read -r webbrowsercommand

	#	Process input.
	cfgline="webbrowser=${webbrowsercommand}"

	#	Replace fariable in configs.
	sed -i "15s|.*|$cfgline|g" "${basedir}/configs.sh"

	#	Notify user.
	command printf "${TXTLIGHTGREEN}Web browser set to: '${RESETALL}"
	command printf "${TXTLIGHTYELLOW}${webbrowsercommand}${RESETALL}"
	command echo -e "${TXTLIGHTGREEN}'.${RESETALL}"
fi
