{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    shellcheck
    autojump
    exa
    unzip
    unrar
    jq
    neofetch
    speedtest-cli
    ranger
    w3m
    ffmpegthumbnailer
    atool
    taskwarrior
    tasksh
    xsel
    lm_sensors
    ag
    powerline-go
    nix-prefetch-git
    bat
    youtube-dl
    exfat
    tldr
    glances
    killall
    ncdu
    intel-gpu-tools
    pciutils
    glxinfo
    kubectl
    bazel
  ];

  programs = {
    bash.enableCompletion = true;
    tmux.enable = true;
  };
}
