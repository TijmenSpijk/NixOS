{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    		shellAliases = {
        # replace ls with eza
       	ls = "eza";
       	lsa = "eza -lahG";
       	tree = "eza -T";
       	# replace cat with bat
       	cat = "bat";
        # replace (h)top with btop
       	top = "btop";
       	htop = "btop";
        # easy upgrade and update commands
        update-system = "cd ~/nixos && sudo nix flake update && sudo nixos-rebuild switch && cd -";
        update-home= "cd ~/nixos && sudo nix flake update home-manager";
		};
  };
}
