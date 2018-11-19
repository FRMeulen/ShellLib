#   Project: Shell-Functions.
#   spotify.sh --   Spotify controller.
#   Revisions:
#   2018-11-15  --  F.R. van der Meulen --  Created.

#   Import scripts.
basedir=$(dirname $BASH_SOURCE)
source "${basedir}/texteffects.sh"
source "${basedir}/configs.sh"

#   Function definition.
spotify() {
    #   Start spotify.
    if [[ $@ == "start" ]]; then
        command echo -e "${TXTGREEN}Starting spotify!${RESETALL}"
    	command spotify </dev/null &>/dev/null
    
    #   Play music.
    elif [[ $@ == "play" ]]; then
        command dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Play 
        command echo -e "${TXTGREEN}Started music!${RESETALL}"
    
    #   Pause music.
    elif [[ $@ == "pause" ]]; then
        command dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Pause
        command echo -e "${TXTGREEN}Paused music!${RESETALL}"
    
    #   Toggle music.
    elif [[ $@ == "toggle" ]]; then
        command dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
        command echo -e "${TXTGREEN}Toggled music!${RESETALL}"
    
    #   Replay song.
    elif [[ $@ == "replay" ]]; then
        command dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous 
        command echo -e "${TXTGREEN}Replayed song!${RESETALL}"
    
    #   Next song.
    elif [[ $@ == "next" ]]; then
        command dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next
        command echo -e "${TXTGREEN}Skipped to next song!${RESETALL}"
    
    #   Previous song.
    elif [[ $@ == "prev" ]]; then
		command dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous
		command dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous
        command echo -e "${TXTGREEN}Reverted to previous song!${RESETALL}"
    
    #   No argument.
    else
        command echo -e "${TXTGREEN}Starting spotify!${RESETALL}"
        command spotify < /dev/null & > /dev/null
    fi
}