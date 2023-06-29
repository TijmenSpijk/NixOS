{ config, pkgs, ... }:

{
	imports = [
		./programs
  	];

  	# Home Manager needs a bit of information about you and the
  	# paths it should manage.
  	home.username = "tijmen";
  	home.homeDirectory = "/home/tijmen";
	
	programs.git = {
    		enable = true;
    		userName  = "Tijmen van der Spijk";
    		userEmail = "tijmenspijk@gmail.com";
  	};
	
	gtk = {
		enable = true;

		theme = {
			name = "Nordic";
			package = pkgs.nordic;
		};

		iconTheme = {
			name = "Nordzy";
			package = pkgs.nordzy-icon-theme;
		};

		cursorTheme = {
			name = "Nordzy-cursors";
			package = pkgs.nordzy-cursor-theme;
		};
	};

	nixpkgs.overlays = [
		(final: prev: {
			picom = prev.picom.overrideAttr ( old: {
				src = prev.fetchFromGithub {
					owner = "jonaburg";
					repo = "picom";
					rev = "56830e885ec84f3ae3ebd1da2edb710e2d16c40f";
					hash = "";
				};
			});
		})
	];

  	# This value determines the Home Manager release that your
  	# configuration is compatible with. This helps avoid breakage
  	# when a new Home Manager release introduces backwards
  	# incompatible changes.
  	#
  	# You can update Home Manager without changing this value. See
  	# the Home Manager release notes for a list of state version
  	# changes in each release.
  	home.stateVersion = "23.05";

  	# Let Home Manager install and manage itself.
  	programs.home-manager.enable = true;
}
