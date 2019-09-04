# Load .Xresources
# [[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Enable "natural" scrolling
xinput --set-prop Elan\ TrackPoint "libinput Natural Scrolling Enabled" 1

# Slow down pointer acceleration
xinput set-prop Elan\ TrackPoint "libinput Accel Speed" -0.4

#exec xss-lock -- xscreensaver -no-splash &
#exec xss-lock -- i3lock -n &
#xss-lock -- /usr/bin/slock &

# screen locker
env XSECURELOCK_SAVER=/usr/lib/xscreensaver/cubicgrid XSECURELOCK_WANT_FIRST_KEYPRESS=1 xss-lock -l -- xsecurelock &

# make it red
redshift &

exec i3
