{config, pkgs, ...}: {
	imports = [
		./alacritty.nix
		./starship.nix
		./bat.nix
	];

	home.file.".config/bspwm/bspwmrc".source = ../../.config/bspwmrc;
	home.file.".config/sxhkd/sxhkdrc".source = ../../.config/sxhkdrc;

	home.file.".config/fish/config.fish".source = ../../.config/config.fish;

	home.file.".config/picom/picom.conf".source = ../../.config/picom.conf;
}
