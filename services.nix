{ config, pkgs, ... }: {
	
	services = {

		# X11
		xserver = {
        		enable = true;
        		layout = "us";

        		displayManager = {
            			lightdm.enable = true;
            			defaultSession = "none+bspwm";
            			autoLogin.enable = true;
            			autoLogin.user = "tijmen";
				#setupCommands = ''
				#	${pkgs.xorg.xrandr}/bin/xrandr --output DP-3 --mode 3440x2160 --scale 0.8x0.8 --pos 0x0 --rotate normal
				#'';
        		};

        		windowManager = {
            			bspwm.enable = true;
        		};

    		};

		# Picom
    		picom = {
        		enable = true;
        		opacityRules = [
            			"80:class_g = 'Alacritty'"
        		];
        		settings = {
				# Blur
				blur = {
                			method = "dual_kawase";
                			size = 10;
            			};

				# Shadows

				# Fade

				

        		};

        		fade = true;
        		fadeDelta = 5;
    		};

		# Redshift
		redshift = {
			enable = true;
			temperature = {
				day = 5500;
				night = 3700;
			};
		};
	

  		# Enable the OpenSSH daemon.
  		openssh = {
    			enable = true;
    			openFirewall = true;
    			settings = {
        			PermitRootLogin = "no";
        			PasswordAuthentication = false;
        			X11Forwarding = true;
    			};
		};
	};

	programs.dconf.enable = true;
}
