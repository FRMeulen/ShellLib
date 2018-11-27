#	Project: Shell-Functions.
#	projwiz.sh	--	Navigation & creation of projects.
#	Revisions:
#	2018-11-16	--	F.R. van der Meulen	--	Created.

#	Import scripts.
basedir=$(dirname $BASH_SOURCE)
source "${basedir}/texteffects.sh"
source "${basedir}/configs.sh"

#	Function definition.
proj() {
	#	Notify user.
	command echo -e "${TXTLIGHTMAGENTA}---Project Wizard invoked---${RESETALL}"

	#	Check if projects directory is configured.
	if [[ ${projdir} == "" ]]; then
		command echo -e "${TXTLIGHTRED}Project directory not configured!${RESETALL}"
		command echo -e "${TXTLIGHTRED}Please use ${TXTLIGHTYELLOW}'bashrc -refresh'${TXTLIGHTRED}.${RESETALL}"
		exit 1
	fi

	#	Request action.
	command echo -e "${TXTLIGHTCYAN}Select option:${RESETALL}"
	command echo -e "	${TXTLIGHTYELLOW}find	--	Finds & opens project directory.${RESETALL}"
	command echo -e "	${TXTLIGHTYELLOW}list	--	Lists all available projects.${RESETALL}"
	command echo -e "	${TXTLIGHTYELLOW}make	--	Makes new project directory.${RESETALL}"
	command echo -e "	${TXTLIGHTYELLOW}delete	--	Deletes project directory.${RESETALL}"

	#	Read user action.
	command printf "${TXTLIGHTCYAN}Find, list or make: ${RESETALL}"
	read -r action

	#	Find option.
	if [[ ${action} == "find" ]]; then
		#	Invoke project finder.
		command echo ""
		command echo -e "${TXTLIGHTMAGENTA}---Project finder invoked---${RESETALL}"
	
		#	Ask project name.
		command printf "${TXTLIGHTCYAN}Please enter project name: ${RESETALL}"
		read -r projname

		#	If project exists.
		if [[ -d ${projdir}/${projname} ]]; then
			#	Notify user.
			command echo -e "${TXTLIGHTGREEN}Project found!${RESETALL}"

			#	Change directory.
			command echo -e "${TXTLIGHTGREEN}Changing directory...${RESETALL}"
			command cd "${projdir}/${projname}"
		else
			#	Notify user.
			command echo -e "${TXTLIGHTRED}Project not found!${RESETALL}"

			#	Ask for answer.
			command echo -e "${TXTLIGHTYELLOW}Would you like to create it?"
			command printf "y / n : "
			read -r yn

			#	If yes.
			if [[ yn == "y" ]]; then
				command echo -e "${TXTLIGHTCYAN}Creating project ${TXTLIGHTYELLOW}${projname}...${RESETALL}"
			fi

		fi

	#	List option.
	elif [[ ${action} == "list" ]]; then
		#	Invoke project list.
		command echo ""
		command echo -e "${TXTLIGHTMAGENTA}---Project list invoked---${RESETALL}"
		
		#	List projects.
		command echo -e "${TXTLIGHTCYAN}Current projects:${TXTLIGHTYELLOW}"
		command ls "${projdir}"

	#	Make option.
	elif [[ ${action} == "make" ]]; then
		#	Invoke project maker.
		command echo ""
		command echo -e "${TXTLIGHTMAGENTA}---Project maker invoked---${RESETALL}"
		
		#	Ask for project name.
		command printf "${TXTLIGHTCYAN}Name for new project: ${RESETALL}"
		read -r projname

		#	If project already exists.
		if [[ -d ${projdir}/${projname} ]]; then
			#	Notify user.
			command echo -e "${TXTLIGHTRED}Project already exists!"
			
			#	Ask to overwrite.
			command echo -e "${TXTLIGHTYELLOW}Overwrite?"
			command printf "y / n : "
			read -r yn

			#	If user answers yes.
			if [[ ${yn} == "y" ]]; then
				#	Notify user.
				command printf "${TXTBOLD}${TXTLIGHTRED}!!This will delete the current '${RESETALL}"
				command printf "${TXTLIGHTYELLOW}${projname}${RESETALL}"
				command echo -e "${TXTBOLD}${TXTLIGHTRED}' project!!${RESETALL}"
				
				#	Second safety check.
				command echo -e "${TXTLIGHTRED}Are you sure?${RESETALL}"
				command printf "${TXTLIGHTYELLOW}y / n : "
				read -r safetycheck

				#	If user answers yes again.
				if [[ ${safetycheck} == "y" ]]; then
					#	Notify user.
					command printf "${TXTBOLD}${TXTLIGHTRED}Deleting project '${RESETALL}"
					command printf "${TXTLIGHTYELLOW}${projname}${RESETALL}"
					command echo -e "${TXTBOLD}${TXTLIGHTRED}'...${RESETALL}"

					#	Delete current project.
					rm -rf "${projdir}/${projname}"
					command echo -e "${TXTLIGHTRED}Done!${RESETALL}"

					#	Create new project.
					command echo -e "${TXTLIGHTGREEN}Creating new project...${RESETALL}"
					mkdir "${projdir}/${projname}"
					mkdir "${projdir}/${projname}"/src
					mkdir "${projdir}/${projname}"/res

					#	Notify user.
					command echo -e "${TXTLIGHTCYAN}Done!${RESETALL}"
				
				#	If user answers no.
				else
					command echo -e "${TXTLIGHTCYAN}Project left as is!"
				fi

			#	If user answers no.
			else
				command echo -e "${TXTLGHTCYAN}Project left as is!${RESETALL}"
			fi
		
		#	If project does not exist.
		else
			#	Notify user.
			command echo -e "${TXTLIGHTGREEN}Creating project...${RESETALL}"

			#	Create project.
			mkdir "${projdir}/${projname}"
			mkdir "${projdir}/${projname}"/src
			mkdir "${projdir}/${projname}"/res

			#	Notify user.
			command echo -e "${TXTLIGHTCYAN}Done!${RESETALL}"
		fi

	#	Delete option.
	elif [[ ${action} == "delete" ]]; then
		#	Invoke project deleter.
		command echo ""
		command echo -e "${TXTLIGHTMAGENTA}---Project deleter invoked---${RESETALL}"
		
		#	Ask for project name.
		command printf "${TXTLIGHTCYAN}Name of project: ${RESETALL}"
		read -r projname

		#	If project exists.
		if [[ -d ${projdir}/${projname} ]]; then
			#	Notify user.
			command printf "${TXTLIGHTRED}This will delete project '${RESETALL}"
			command printf "${TXTLIGHTYELLOW}${projname}${RESETALL}"
			command echo -e "${TXTLIGHTRED}', are you sure?"

			#	Ask for verification.
			command printf "${TXTLIGHTYELLOW}y / n : "
			read -r yn

			#	If user answers yes.
				if [[ ${safetycheck} == "y" ]]; then
					#	Notify user.
					command printf "${TXTBOLD}${TXTLIGHTRED}Deleting project '${RESETALL}"
					command printf "${TXTLIGHTYELLOW}${projname}${RESETALL}"
					command echo -e "${TXTBOLD}${TXTLIGHTRED}'...${RESETALL}"

					#	Delete current project.
					rm -rf "${projdir}/${projname}"
					command echo -e "${TXTLIGHTRED}Done!${RESETALL}"
				
				#	If user answers no.
				else
					command echo -e "${TXTLIGHTCYAN}Project left as is!"
				fi			
		
		#	If project does not exist
		else
			command printf "${TXTLIGHTRED}Project '${RESETALL}"
			command printf "${TXTLIGHTYELLOW}${projname}${RESETALL}"
			command echo -e "${TXTLIGHTRED}' does not exist!"
		fi

	#	Invalid options.
	else
		command echo ""
		command echo -e "${TXTLIGHTRED}Invalid option!${RESETALL}"
	fi

	#	Notify user.
	command echo -e "${TXTLIGHTMAGENTA}---Project Wizard ended---"
}