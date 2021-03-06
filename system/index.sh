#!/bin/bash -e

relativePath="$DOTFILES_LOCATION/system"
source "$relativePath/wifi.sh"
source "$relativePath/bluetooth.sh"
source "$relativePath/sound.sh"
source "$relativePath/screen.sh"
source "$relativePath/acestream.sh"
source "$relativePath/tmux.sh"

if [[ $(uname) == "Darwin" ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

alias cat='bat'
alias ll='exa'
alias la='ll'
alias exa='exa -bghla --git --group-directories-first'
alias grep="grep --color=auto"
alias dotfiles='(cd "$DOTFILES_LOCATION" && emacs -nw)'
alias ffs='sudo $(fc -ln -1)'
alias shortcuts="$DOTFILES_LOCATION/config/shortcuts/shortcuts.sh"
alias cls='printf "\033c"'
alias vpnHabitoUp='nmcli connection up Office\ VPN'
alias vpnHabitoDown='nmcli connection down Office\ VPN'
alias reconnectNordvpn='nordvpn -o ~/Downloads/primary.ovpn -c ~/credentials.txt'
alias mountWindows='sudo mount /dev/sda4 /windows'
alias emptyTrash='rm -rf ~/.local/share/Trash/*'
alias restartX='systemctl restart display-manager.service'

vpnPrimaryUp () {
  nmcli connection import type openvpn file ~/Downloads/primary.ovpn
  nmcli connection up primary
}

vpnPrimaryDown () {
  nmcli connection down primary
}

yankClip () {
  YANK_CMD_PATH=$(which yank)
  YANK_CLI_CMD_PATH=$(which yank-cli)
  if [ -z "$YANK_CMD_PATH" ]; then
    CMD="$YANK_CLI_CMD_PATH"
  else
    CMD="$YANK_CMD_PATH"
  fi
  $CMD -- xsel -b $@
}

autogeneratePassword () {
  LC_CTYPE=C tr -dc "[:alnum:]" < /dev/urandom | fold "-w${1:-32}" | head -1
}

every() {
  watch -c -n "$1" "$2"
}

up() {
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++)); do
    d=$d/..
  done
  d=$(echo $d | sed 's/^\///')
  if [[ -z "$d" ]]; then
    d=..
  fi
  cd $d
}

kernelModuleParameters() {
  cat /proc/modules | cut -f 1 -d " " | while read module; do \
    echo "Module: $module"; \
    if [ -d "/sys/module/$module/parameters" ]; then \
      ls /sys/module/$module/parameters/ | while read parameter; do \
      echo -n "Parameter: $parameter --> "; \
      cat /sys/module/$module/parameters/$parameter; \
    done; \
  fi; \
  echo; \
done
}

killByName() {
  pkill "$1"
}

showPublicIp() {
  local content
  local ip
  local city
  local country
  content=$(curl -s ipinfo.io/)
  ip=$(echo "$content" | jq -r .ip)
  city=$(echo "$content" | jq -r .city)
  country=$(echo "$content" | jq -r .country)
  echo "$ip - $city ($country)"
}

showListeningPorts() {
  sudo netstat -tulpn | grep LISTEN
}

backupSystem() {
  rsync -aAXv --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / $1
}

alias trayer='trayer --width 30 --widthtype pixel --SetDockType false --edge top --align center'

cpuDrainers() {
  ps aux --sort %cpu | tail -5 | cut -c 22-150
}

setTermiteTitle() {
  echo `tput tsl` $1  `tput fsl`
}

forceHwClock() {
  #$1 = 2018-03-15
  sudo hwclock --set --date "$1"
  sudo systemctl restart systemd-timesyncd.service
}

portOfProcessNamed() {
  netstat -tlpn  | grep "$1"
}

updateDns() {
  sudo resolvconf -u
}

findFileByContent() {
  find "$2" -iname "*$3*" -exec grep -Hn "$1" {} \;
}

findFileByName() {
  sudo find "$2" -iname "*$1*" -type f
}

disableIpV6() {
  INTERFACE=$(ip route | awk '/^default/ { print $5 ; exit }')
  sudo sh -c "echo 1 > /proc/sys/net/ipv6/conf/$INTERFACE/disable_ipv6"
}

showProcessPort() {
  netstat -tlpn  | grep "$1"
}

showLargestFiles() {
  if [[ -n "$1" ]]; then
    COUNT=$1
  else
    COUNT=5
  fi
  sudo find -type f -exec du -Sh {} + | sort -rh | head -n $COUNT
}
