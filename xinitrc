!#/bin/zsh
export PATH=$PATH:/home/cray/.cabal/bin
xsetroot -cursor_name left_ptr
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --transparent true --alpha 0 --tint 0x000000 --height 16&
exec dbus-launch --auto-syntax --exit-with-session xmonad
