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
		};
  };

}
