#	Project: Shell-Functions.
#	calc.sh	--	Simple shell calculator.
#	Revisions:
#	2018-11-15	--	F.R. van der Meulen	--	Created.

#   Import scripts.
basedir=$(dirname $BASH_SOURCE)
source "${basedir}/texteffects.sh"
source "${basedir}/configs.sh"

#	Function definition.
calc() {
	#	Notify user of invocation.
	command echo -e "${TXTBOLD}${TXTBLACK}${BGLIGHTCYAN}Simple calculator invoked!${RESETALL}"
	
	#	Notify user.
	if [[ "$#" -ne 3 ]]; then
		command echo -e "${TXTLIGHTRED}Wrong amount of arguments...${RESETALL}"
		command echo -e "Usage: ${TXTLIGHTYELLOW}calc [NUMBER] [OPERATOR] [NUMBER]"
		exit 1
	fi

	#	Store arguments.
	left=$1
	operator=$2
	right=$3

	#	Number regex pattern.
	regexnum='^[0-9]+$'

	#	If first argument is not a number.
	if ! [[ ${left} =~ ${regexnum} ]]; then
   		#	Notify user.
   		command echo -e "${TXTLIGHTRED}First argument is not a number..."
   	
   	#	If first argument is a number.
   	else
   		#	If third argument is not a number.
		if ! [[ ${right} =~ ${regexnum} ]]; then
   			#	Notify user.
   			command echo -e "${TXTLIGHTRED}Third argument is not a number..."
   		
   		#	If third argument is a number.
   		else
   			#	If operator is '+'.
			if [[ "${operator}" == "+" ]]; then
				#	Add left to right.
				result=$((${left} + ${right}))
				
				#	Return result.
				command echo -e "${TXTLIGHTYELLOW}Result: ${left} ${operator} ${right} = ${result}"
			
			#	If operator is '-'.
			elif [[ $2 == "-" ]]; then
				#	Subtract right from left.
				result=$((${left} - ${right}))

				#	Return result.
				command echo -e "${TXTLIGHTYELLOW}Result: ${left} ${operator} ${right} = ${result}"
			
			#	If operator is 'x'.
			elif [[ $2 == "x" ]]; then
				#	Multiply left by right.
				result=$((${left} * ${right}))

				#	Return result.
				command echo -e "${TXTLIGHTYELLOW}Result: ${left} ${operator} ${right} = ${result}"
			
			#	If operator is '/'.
			elif [[ $2 == "/" ]]; then
				#	Divide left by right.
				result=$((${left} / ${right}))
				
				#	Return result.
				command echo -e "${TXTLIGHTYELLOW}Result: ${left} ${operator} ${right} = ${result}"
			
			#	If operator is none of the above.
			else
				#	Notify user.
				command echo -e "${TXTLIGHTRED}Operator ${RESETALL} ${TXTLIGHTYELLOW}${operator} ${TXTLIGHTRED} unknown..."
				command echo -e "${TXTLIGHTYELLOW}Operators are: '+' '-' 'x' '/'"
			fi
		fi
	fi
}