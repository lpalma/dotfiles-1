{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    yarn
    yarn2nix
    nodePackages.tern
    sass
    nodePackages.grunt-cli
  ];
}
