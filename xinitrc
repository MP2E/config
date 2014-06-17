!#/bin/zsh
export PATH=$PATH:/home/cray/.cabal/bin
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"
xsetroot -cursor_name left_ptr
exec dbus-launch --auto-syntax --exit-with-session xmonad
