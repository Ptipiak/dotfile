#!/bin/sh
player_status=$(playerctl -p $1 status 2> /dev/null)

title=$(playerctl -p $1 metadata title)
if artist=$(playerctl -p $1 metadata artist); then
    song_info="${title} - ${artist}"
else
    song_info="${title}"
fi

if [ "$player_status" = "Playing" ]; then
	status="playing"
	output="${song_info}"
elif [ "$player_status" = "Paused" ] ; then
	status="paused"
	output="${song_info}"
fi

echo -e "{\"text\":\""$output"\",\"class\":\""$status"\"}"
