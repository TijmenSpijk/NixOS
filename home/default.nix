{ config, pkgs, ... }:

{
  imports = [
    ./programs
  ];

  home.username = "tijmen";
  home.homeDirectory = "/home/tijmen";

  programs.vscode = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Tijmen van der Spijk";
    userEmail = "tijmenspijk@gmail.com";
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
