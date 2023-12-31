# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }: {

  	imports = [ # Include the results of the hardware scan.
      		./system.nix
      		./services.nix
    	];
  
  	# Bootloader.
  	boot.loader.systemd-boot.enable = true;
  	boot.loader.efi.canTouchEfiVariables = true;
  	boot.loader.systemd-boot.configurationLimit = 10;


  	nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 1w";
  	};

	nix.settings.auto-optimise-store = true;

  	# Setup keyfile
  	boot.initrd.secrets = {
    		"/crypto_keyfile.bin" = null;
  	};

  	# NixOS Experimental Features
  	nix.settings.experimental-features = [
		"nix-command"
		"flakes"
  	];
  
  	# Allow unfree packages
  	nixpkgs.config.allowUnfree = true;

  	# List packages installed in system profile. To search, run:
  	# $ nix search wget
  	environment.systemPackages = with pkgs; [
		alacritty
		arandr
		bat
		btop
		cargo
		dmenu
		dunst
		exa
		firefox
		flameshot
		fontconfig
		git
		gparted
		lxsession
		mangohud
		neofetch
		nitrogen
		pavucontrol
		picom
		polkit_gnome
		starship
		ranger
		ripgrep
		rofi
		rustc
		tldr
		trash-cli
		vim
		wget
		xclip
		xfce.thunar
		xdg-utils
  	];

  
  	# This value determines the NixOS release from which the default
  	# settings for stateful data, like file locations and database versions
  	# on your system were taken. It‘s perfectly fine and recommended to leave
  	# this value at the release version of the first install of this system.
  	# Before changing this value read the documentation for this option
  	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  	system.stateVersion = "23.05"; # Did you read the comment?
}
