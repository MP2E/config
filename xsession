export PATH=$PATH:/home/cray/user-scripts/bin
export LC_CTYPE="en_US.UTF-8"
xsetroot -cursor_name left_ptr
dunst &
exec xmonad
