{ pkgs, config, ... }: {
	home.file.".config/bspwm/bspwmrc".source = ../bspwm/bspwmrc;
	home.file.".config/sxhkd/sxhkdrc".source = ../bspwm/sxhkdrc;
}
