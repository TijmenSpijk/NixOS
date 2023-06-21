{ pkgs, ...}: {
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

}
