#!/bin/bash -e

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dri() { docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

dockerCleanUpContainers() {
  docker ps -aq | xargs docker stop
  docker ps -aq | xargs docker rm
}

dockerPrune() {
  docker system prune
  docker rmi "$(docker images -a -q)"
}

dockerMangoLogin() {
  aws \
    --profile mangomng \
    ecr get-login \
    --registry-ids 495248209902 \
    --no-include-email | bash -
}

dockerMangoShopRun() {
  docker run \
         --rm \
         -p 1521:1521 \
         -d \
         -v mng_bd_data:/u01/app/oracle/oradata/XE \
         -v mng_bd_fra:/u01/app/oracle/fast_recovery_area/XE \
         495248209902.dkr.ecr.eu-west-1.amazonaws.com/mango/sysops/mng-xe-lt:latest
}