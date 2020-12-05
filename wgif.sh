#!/bin/bash

# If this is run from a symlink it will change directory to the link target
cd "$(dirname "$(realpath "$0")")"

declare -A options=([1]="feh --bg-fill" [2]="xwallpaper --zoom" [3]="xloadimage -onroot -fullscreen" [4]="xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s" [5]="hsetroot -full")
length=${#options[@]}

help_text="foo-Wallpaper-Feh-Gif (wgif)"
help_text="${help_text}\nUsage:"
help_text="${help_text}\n  wgif SPEED GIF_PATH [-t OPTION]"
help_text="${help_text}\n\nOPTIONs (use the number):"
for (( i=1; i<${length}+1; i++ ));
do
	help_text="${help_text}\n  $i: '${options[$i]}'"
done

# The speed the gif will play at, 0.01 is often a good value
speed=$1
gif_path=$2
# shift due to the while loop to get the switch options below
shift; shift
# Default value for the index selected in the `options` array, can be overriden by passing an argument to the command
option=1
# The selected method to play the gif. It is a value chosen from the `options` array above
prog=

help=false
while [ "$#" -gt 0 ]; do
	case $1 in
		-h|--help) help=true; break ;;
		-o|--option) option="$2"; shift ;;
		*) echo "Unknown parameter: $1"; exit 1 ;;
	esac
	shift
done
if [ "$speed" = "-h" ] || [ "$speed" = "--help" ] || [ "$gif_path" = "-h" ] || [ "$gif_path" = "--help" ]; then
	help=true
fi
if [ $help = true ]; then
	echo -e "$help_text"
	exit 0
fi

number_regex="^[0-9]+([.][0-9]+)?$"
if [[ ! $speed =~ $number_regex ]]; then
	echo "'$speed' is not a number"
	exit 1
elif [ ! -f "$gif_path" ]; then
	echo "File '$gif_path' does not exist"
	exit 1
fi

prog=${options[$option]}

if [ "$prog" = "" ]; then
	echo "Invalid value for the 'option' switch";
	exit 1;
fi

./back4.sh "$speed" "$gif_path" "$prog"
