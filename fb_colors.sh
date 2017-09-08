# https://github.com/linuxbbq/xcolors/tree/master/fb_colors
# This file changes the tty/vc colors which comes from the framebuffer
if [ "$TERM" = "linux" ]; then
  ## Console colors - Solarized;
  echo -en "\e]P0073642" #background
  echo -en "\e]P8002b36" #darkgrey
  echo -en "\e]P1dc322f" #darkred
  echo -en "\e]P9cb4b16" #red
  echo -en "\e]P2859900" #darkgreen
  echo -en "\e]PA586e75" #green
  echo -en "\e]P3b58900" #brown
  echo -en "\e]PB657b83" #yellow
  echo -en "\e]P4268bd2" #darkblue
  echo -en "\e]PC839496" #blue
  echo -en "\e]P5d33682" #darkmagenta
  echo -en "\e]PD6c71c4" #magenta
  echo -en "\e]P62aa198" #darkcyan
  echo -en "\e]PE93a1a1" #cyan
  echo -en "\e]P7eee8d5" #lightgrey
  echo -en "\e]PFfdf6e3" #white
  clear #for background artifacting
fi
