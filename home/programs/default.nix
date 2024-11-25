{ config, pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./fish.nix
    ./starship.nix
  ];
}
