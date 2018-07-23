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

# twm &
# xclock -geometry 50x50-1+1 &
# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
# exec xterm -geometry 80x66+0+0 -name login

# xmonad
xrandr -s 0

# xrdb -load $HOME/.Xdefaults
# 
xsetroot -cursor_name left_ptr
# #xsetroot -solid '#0f0f0f'
# 
# xset b off
# xset s off
# xset -dpms
# 
# #xmodmap -e "keysym Super_R = SunCompose"
# 
# fbsetbg -b -solid "#0f0f0f"
# #nitrogen --restore
# 
# xcompmgr &
# #{ sleep 1; urxvt -name ncmpcpp-clock -e ncmpcpp; } &
# #{ sleep 2; urxvt -name ncmpcpp-visualizer -e ncmpcpp; } &
# #{ sleep 3; urxvt -name screen -e screen; } &
# #{ sleep 4; urxvt -name irssi -e ssh and1@server; } &
# #chromium-browser &
# #gmpc &
# 
# export MPD_HOST=localhost
# export MPD_PORT=6600
# export OOO_FORCE_DESKTOP=gnome

exec xmonad > $HOME/.xmonad/log.txt 2>&1

# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
