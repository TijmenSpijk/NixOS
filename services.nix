{ config, pkgs, ... }: {
	
	## X11
	services.xserver = {
        	enable = true;
        	layout = "us";

        	displayManager = {
            	lightdm.enable = true;
            	defaultSession = "none+bspwm";
            	autoLogin.enable = true;
            	autoLogin.user = "tijmen";
        	};

        	windowManager = {
            		bspwm.enable = true;
        	};
    	};

	## Picom
    	services.picom = {
        	enable = true;
        	opacityRules = [
            		"80:class_g = 'Alacritty'"
        	];
        	settings = {
            		blur = {
                		method = "dual_kawase";
                		size = 10;
            		};
        	};

        	fade = true;
        	fadeDelta = 5;
    	};

	# Redshift

  	# Enable the OpenSSH daemon.
  	services.openssh = {
    		enable = true;
    		openFirewall = true;
    		settings = {
        		PermitRootLogin = "no";
        		PasswordAuthentication = false;
        		X11Forwarding = true;
    		};
	};
}
