#   Project: Shell-Functions.
#   bashrc.sh  --   Open or refresh .bashrc from any folder.
#   Revisions:
#   2018-11-15  --  F.R. van der Meulen --  Created.

#   Import scripts.
basedir=$(dirname $BASH_SOURCE)
source "${basedir}/texteffects.sh"
source "${basedir}/configs.sh"

#   Function definition.
bashrc() {
    #   Get home directory.
	homedir=$( getent passwd "$USER" | cut -d: -f6 )
    
    #   Notify user.
    if [[ $# -eq 0 ]]; then
        command echo -e "${TXTLIGHTRED}No arguments provided...${RESETALL}"
        command echo -e "Usage: ${TXTLIGHTYELLOW}bashrc [OPTIONS]"
        command echo -e "       -refresh    --  updates terminal bashrc file."
        command echo -e "       -open       --  opens bashrc in text editor.${RESETALL}"
    
    #   Define actions with one argument.
    elif [[ $# -eq 1 ]]; then
        #   Definition of '-refresh' option.
        if [[ $1 == "-refresh" ]];then
            command echo -e "${TXTBOLD}${TXTBLACK}${BGLIGHTCYAN}Refreshing bashrc!${RESETALL}"
            command pushd "${homedir}"
            command . ./.bashrc
            command popd

        #   Definition of '-open' option.
        elif [[ $1 == "-open" ]]; then
            command echo -e "${TXTCYAN}Opening bashrc!"
            command subl "${homedir}"/.bashrc
        
        #   Notify user.
        else
            command echo -e "${TXTLIGHTRED}Unknown arguments provided...${RESETALL}"
            command echo -e "Usage: ${TXTLIGHTYELLOW}bashrc [OPTIONS]"
            command echo -e "       -refresh    --  updates terminal bashrc file."
            command echo -e "       -open       --  opens bashrc in text editor.${RESETALL}"
        fi

    #   Notify user.
    else
        command echo -e "${TXTLIGHTRED}Too many arguments provided...${RESETALL}"
        command echo -e "Usage: ${TXTLIGHTYELLOW}bashrc [OPTIONS]"
        command echo -e "       -refresh    --  updates terminal bashrc file."
        command echo -e "       -open       --  opens bashrc in text editor.${RESETALL}"
    fi
}