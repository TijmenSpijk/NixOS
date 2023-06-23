{config, ...}: {
	imports = [
		./alacritty.nix
		#./fish.nix
	];

	home.shellAliases = = {
            # replace ls with exa
            ls = "exa";
            lsa = "exa -lahG";
            tree = "exa -T";
            # replace cat with bat
            cat = "bat";
            # replace (h)top with btop
            top = "btop";
            htop = "btop";
    	};
}
