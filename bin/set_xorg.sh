#!/bin/bash
if [ "$1" == desktop ]; then
  cp /etc/X11/xorg.conf.desktop /etc/X11/xorg.conf
  cp /home/megus/.config/bspwm/bspwmrc.desktop /home/megus/.config/bspwm/bspwmrc
  cp /home/megus/.conkyrc.desktop /home/megus/.conkyrc
  echo "Desktop mode enabled."
elif [ "$1" == laptop ]; then
  cp /etc/X11/xorg.conf.laptop /etc/X11/xorg.conf 
  cp /home/megus/.config/bspwm/bspwmrc.laptop /home/megus/.config/bspwm/bspwmrc
  cp /home/megus/.conkyrc.laptop /home/megus/.conkyrc
  echo "Laptop mode enabled."
else
  echo "Error: first argument is either 'desktop' or 'laptop.'"
fi
