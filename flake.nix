{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    # Cosmic
    nixpkgs.follows = "nixos-cosmic/nixpkgs"; # NOTE: change "nixpkgs" to "nixpkgs-stable" to use stable NixOS release
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    # Zen Browser
    zen-browser.url = "github:MarceColl/zen-browser-flake";
    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Stylix
    stylix.url = "github:danth/stylix";
  };

  outputs = {
      self,
      nixpkgs,
      nixos-cosmic,
      home-manager,
      stylix,
      zen-browser,
      ...
    } @ inputs:
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };

          modules = [
            ./configuration.nix

            # Cosmic
            {
              nix.settings = {
                substituters = [ "https://cosmic.cachix.org/" ];
                trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
              };
            }
            nixos-cosmic.nixosModules.default

            # Home Manager
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.tijmen = import ./home;
              home-manager.extraSpecialArgs = {inherit inputs; system = "x86_64-linux";};
              home-manager.backupFileExtension = "backup";
            }

            # Stylix
            stylix.nixosModules.stylix

          ];
        };
      };
    };
}
