{ config, pkgs, ... }:

{
  imports = [
    ./programs
  ];

  home.username = "tijmen";
  home.homeDirectory = "/home/tijmen";

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
