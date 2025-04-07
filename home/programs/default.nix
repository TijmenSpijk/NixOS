{ config, pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./fish.nix
    ./starship.nix
    ./vscode.nix
  ];

  programs.git = {
    enable = true;
    userName = "Tijmen van der Spijk";
    userEmail = "tijmenspijk@gmail.com";
  };
}
