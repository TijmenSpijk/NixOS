{ config, pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./fish.nix
    ./starship.nix
  ];

  programs.git = {
    enable = true;
    userName = "Tijmen van der Spijk";
    userEmail = "tijmenspijk@gmail.com";
  };

  programs.steam = {
    enable = true;
  }
}
