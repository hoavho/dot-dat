#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

####### My configs are below #######
# Keyboard Layout
setxkbmap us &

# BEGIN - Display Configs for MacbookPro 15' 2015 Retina
xrandr --output HDMI-3 --off
xrandr --output eDP-1 --mode 2880x1800 --dpi 226
sleep 1
xrandr --output HDMI-3 --mode 3840x2160 --dpi 164 --left-of eDP-1
# END - Display Configs for MacbookPro 15' 2015 Retina

# Start dwmblocks
dwmblocks &

# Loop dwm (so we can restart dwm and it automatically starts up right away)
#while true; do
#	dwm > /dev/null 2>&1
#done

exec dwm
