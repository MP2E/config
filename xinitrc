!#/bin/zsh
export PATH=$PATH:/home/cray/.cabal/bin
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"
xsetroot -cursor_name left_ptr
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --transparent true --alpha 0 --tint 0x000000 --height 16
sleep 2s
exec dbus-launch --auto-syntax --exit-with-session xmonad
