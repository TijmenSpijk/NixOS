{ config, pkgs, ... }: {
	imports = [
		./hardware-configuration.nix
	];

	# Networking
	networking.hostName = "nixos-vm";
	networking.wireless.enable = false;
	networking.networkmanager.enable = true;

	# Video Drivers
}
