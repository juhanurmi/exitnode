# BACKUP interfaces in case this script removes it
sudo cp /etc/network/interfaces /etc/network/interfaces.bak

# GUI-related packages
pkgs="
x11-common
xserver-xorg-video-fbdev
xserver-xorg xinit
gstreamer1.0-x gstreamer1.0-omx gstreamer1.0-plugins-base
gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-alsa
gstreamer1.0-libav
epiphany-browser
lxde lxtask menu-xdg gksu
xserver-xorg-video-fbturbo
xpdf gtk2-engines alsa-utils
netsurf-gtk zenity
desktop-base lxpolkit
weston
omxplayer
raspberrypi-artwork
lightdm gnome-themes-standard-data gnome-icon-theme
qt50-snapshot qt50-quick-particle-examples
"

# Edu-related packages
pkgs="$pkgs
idle python3-pygame python-pygame python-tk
idle3 python3-tk
python3-rpi.gpio
python-serial python3-serial
python-picamera python3-picamera
python3-pygame python-pygame python-tk
python3-tk
debian-reference-en dillo x2x
scratch nuscratch
timidity
smartsim penguinspuzzle
pistore
sonic-pi
python3-numpy
python3-pifacecommon python3-pifacedigitalio python3-pifacedigital-scratch-handler python-pifacecommon python-pifacedigitalio
oracle-java8-jdk
minecraft-pi python-minecraftpi
wolfram-engine
"
# Because of of https://github.com/RPi-Distro/raspberrypi-ui-mods/issues/2 (thanks @robertely)
apt-get -y remove raspberrypi-ui-mods

# Remove packages
for i in $pkgs; do
	echo apt-get -y remove --purge $i
done

# Remove automatically installed dependency packages
echo apt-get -y autoremove

# Remove all packages marked rc (thanks @symm)
dpkg --list |grep "^rc" | cut -d " " -f 3 | xargs dpkg --purge 

# Return interfaces if needed
sudo cp /etc/network/interfaces.bak /etc/network/interfaces
