{ config, pkgs, ...}: {

	# Locale
	# Set your time zone.
  	time.timeZone = "Europe/Amsterdam";

  	# Select internationalisation properties.
  	i18n.defaultLocale = "en_US.UTF-8";

  	i18n.extraLocaleSettings = {
    		LC_ADDRESS = "nl_NL.UTF-8";
    		LC_IDENTIFICATION = "nl_NL.UTF-8";
    		LC_MEASUREMENT = "nl_NL.UTF-8";
    		LC_MONETARY = "nl_NL.UTF-8";
   		LC_NAME = "nl_NL.UTF-8";
    		LC_NUMERIC = "nl_NL.UTF-8";
    		LC_PAPER = "nl_NL.UTF-8";
    		LC_TELEPHONE = "nl_NL.UTF-8";
    		LC_TIME = "nl_NL.UTF-8";
  	};

	  # Define a user account. Don't forget to set a password with ‘passwd’.
  	users.users.tijmen = {
    		isNormalUser = true;
    		description = "tijmen";
    		extraGroups = [ "networkmanager" "wheel" ];
    		openssh.authorizedKeys.keys = [
    			"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHCAOh2ehYZdZt6CaD05aHV2qvqJjq0aWhsXYiDCJ1fq tijme@PC-Tijmen"
    		];
    		packages = with pkgs; [];
  	};
		
	# Shell
	users.defaultUserShell = pkgs.fish;
	environment.shells = with pkgs; [ fish ];
	programs.fish = {
		enable = true;
		shellAliases = {
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
	};

	# Setup NeoVim as system-wide default editor
	programs.neovim = {
    		enable = true;
    		defaultEditor = true;
    		viAlias = true;
    		vimAlias = true;
  	};
	
	# Sound

	# Fonts
	fonts = {	
		fonts = with pkgs; [
			(nerdfonts.override { fonts = [ "Meslo" ]; })
		];	
		fontconfig.defaultFonts = {
			monospace = [ "Meslo LG L Regular Nerd Font Complete Mono" ];
		};
  	};	

}

