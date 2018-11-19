#	Project: Shell-Functions.
#	config.sh	--	Holds configs.
#	Revisions:
#	2018-11-15	--	F.R. van der Meulen	--	Created.

#   Import text effects.
basedir=$(dirname $BASH_SOURCE)
source "${basedir}/texteffects.sh"

#	Configs.
homedir=$( getent passwd "$USER" | cut -d: -f6 )
projdir=/home/falco/Documents/TI/OwnProjects
list="${homedir}"/Documents/.todo