{ pkgs, config, ... }: {
	home.file.".config/bspwm/bspwmrc".source = ../../.config/bspwmrc;
	home.file.".config/sxhkd/sxhkdrc".source = ../../.config/sxhkdrc;
}
