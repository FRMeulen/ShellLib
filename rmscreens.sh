#	Project: Shell-Functions.
#	rmscreens.sh	--	Deletes all screenshots in pictures folder.
#	Revisions:
#	2018-11-15	--	F.R. van der Meulen	--	Created.

#   Import scripts.
basedir=$(dirname $BASH_SOURCE)
source "${basedir}/texteffects.sh"
source "${basedir}/configs.sh"

#   Function definition.
rmscreens() {
	#	Notify user.
    command echo -e "${TXTLIGHTCYAN}Deleting screenshots...${RESETALL}"
    
    #	Delete screenshots.
    for file in "${homedir}"/Pictures/Screenshot*.png; do
        command echo -e "${TXTLIGHTRED}Deleting ${file}...${RESETALL}"
        command rm "${file}"
    done
    
    #	Notify user.
    command echo -e "${TXTLIGHTCYAN}Done!${RESETALL}"
}