{ config, lib, pkgs, ...}: {
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
	services.picom = {
		enable = true;
		opacityRules = [
			"80:class_g = 'Alacritty'"
		];
		settings.blur = {
			method = "gaussian";
			size = 10;
			deviation = 5.0;
		};
	};
	
	services.picom.package = pkgs.picom.overrideAttrs(o: {
		src = pkgs.fetchFromGithub {
			repo = "picom";
			owner = "ibhagwan";
			rev = "44b4970f70d6b23759a61a2b94d9bfb4351b41b1";
		};
	});

}
