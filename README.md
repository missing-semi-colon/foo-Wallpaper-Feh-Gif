# About foo-Wallpaper-Feh-Gif
This is just a loop script that sets a gif as a wallpaper. Supports transparency. Requires feh or xload or [xwallpaper](https://github.com/stoeckmann/xwallpaper) (uses less cpu).

! INCREASES CPU use

<img src="https://github.com/thomas10-10/foo-Wallpaper-Feh-Gif/raw/master/desktop-animation2.gif"  />
<img src="https://github.com/thomas10-10/foo-Wallpaper-Feh-Gif/raw/master/desktop-animation4.gif"  />

# More gif here
https://imgur.com/a/F6w9Vr4
https://imgur.com/a/XxraHzY


# To run it
Download back4.sh and wgif.sh and find a gif you want to run.
By default gifs are played using feh, if you don't have feh installed or want to use something else change this by passing in one of the numbers below with the -o switch:
- 1: "feh --bg-fill"
- 2: "xwallpaper --zoom"
- 3: "xloadimage -onroot -fullscreen"
- 4: "xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitor0/workspace0/last-image -s"
- 5: "hsetroot -full")

```
./wgif.sh speed path_to_gif [-o number] &
```

## Example
```
chmod +x back4.sh wgif.sh
./wgif.sh 0.01 /path/to/gif -o 2 &
```

# To stop it
```
killall back4.sh
```

# autostart with i3, in i3 config:

```
exec_always --no-startup-id killall back4.sh 
exec_always --no-startup-id $HOME/back4.sh speed /path/to/gif [-o number]
```

# To clean cache
 ```
rm -rf /tmp/back4
```

I search a lighter alternative than feh in cpu ress
