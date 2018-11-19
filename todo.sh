#   Project: Shell-Functions.
#   todo.sh    --   Makes & manages to-do lists.
#   Revisions:
#   2018-11-15  --  F.R. van der Meulen.    --  Created.

#   Import scripts.
basedir=$(dirname $BASH_SOURCE)
source "${basedir}/texteffects.sh"
source "${basedir}/configs.sh"

#   Function definition.
todo () {
    #   Notify user.
    command echo -e "${CYAN}Todo list invoked!${NOCOL}"
    if [[ $# -eq 0 ]]; then
        command echo -e "${LRED}No arguments provided..."
        command echo -e "${NOCOL}Usage: ${YELLOW}todo [OPTIONS]"
        command echo -e "       -show            		--  shows current todo list."
        command echo -e "       -add [string]    		--  adds task to list."
        command echo -e "       -remove [number] 		--  removes task from list."
        command echo -e "       -clear           		--  clears entire todo list."
        command echo -e "		-edit [number] [string]	--	replaces line at number with string.${NOCOL}"
    elif [[ $# -eq 1 ]]; then
        if [[ $1 == "-show" ]]; then
            command echo -e "${CYAN}To do:${NOCOL}"
            command cat -n "${list}"
        elif [[ $1 == "-clear" ]]; then
            command echo -e "${LRED}Clearing to-do list...${NOCOL}"
            command rm "${list}"
            touch "${list}"
        else
            command echo -e "${LRED}Unknown/wrong arguments..."
            command echo -e "${NOCOL}Usage: ${YELLOW}todo [OPTIONS]"
            command echo -e "       -show            		--  shows current todo list."
            command echo -e "       -add [string]    		--  adds task to list."
            command echo -e "       -remove [number] 		--  removes task from list."
            command echo -e "       -clear           		--  clears entire todo list."
        	command echo -e "		-edit [number] [string]	--	replaces line at number with string.${NOCOL}"
        fi
    elif [[ $# -eq 2 ]]; then
        if [[ $1 == "-add" ]]; then
            entry=$2
            command echo -e "${CYAN}Adding ${YELLOW}'${entry}' ${CYAN}to list!"
            command echo "${entry}" >> "${list}"
        elif [[ $1 == "-remove" ]]; then
            entry=$2
            command echo -e "${CYAN}Removing entry ${YELLOW}'${entry}' ${CYAN}from list!"
            command sed -i "${entry}d" "${list}"
        else
            command echo -e "${LRED}Unknown/wrong arguments..."
            command echo -e "${NOCOL}Usage: ${YELLOW}todo [OPTIONS]"
            command echo -e "       -show            --  shows current todo list."
            command echo -e "       -add [string]    --  adds task to list."
            command echo -e "       -remove [number] --  removes task from list."
            command echo -e "       -clear           --  clears entire todo list."
            command echo -e "		-edit [number] [string]	--	replaces line at number with string.${NOCOL}"
        fi
    elif [[ $# -eq 3 ]]; then
    	if [[ $1 == "-edit" ]]; then
    		line=$2
    		entry=$3
    		command echo -e "${CYAN}Replaced line ${YELLOW}${line} ${CYAN}with ${YELLOW}'${entry}' ${CYAN}in list!"
    		sed -i "${line}s/.*/${entry}/" "${list}"
    	else
    		command echo -e "${LRED}Unknown/wrong arguments..."
            command echo -e "${NOCOL}Usage: ${YELLOW}todo [OPTIONS]"
            command echo -e "       -show            --  shows current todo list."
            command echo -e "       -add [string]    --  adds task to list."
            command echo -e "       -remove [number] --  removes task from list."
            command echo -e "       -clear           --  clears entire todo list."
            command echo -e "		-edit [number] [string]	--	replaces line at number with string.${NOCOL}"	
    	fi
    fi
}