{
  description = "hiimkobeand's nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord.url = "github:KaylorBen/nixcord";
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs =
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./modules/application
            ./modules/desktop-environment
            ./modules/system
            ./modules/style.nix
            ./services
            ./hosts/desktop/configuration.nix
            (
              { config, ... }:
              {
                config = {
                  nix = {
                    settings = {
                      substituters = [
                        "https://cosmic.cachix.org/"
                        "https://ezkea.cachix.org"
                      ];
                      trusted-public-keys = [
                        "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
                        "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
                      ];
                    };
                  };
                  nvidia.enable = true;
                  gnome.enable = false;
                  cosmic-de.enable = true;
                };
              }
            )
            inputs.home-manager.nixosModules.home-manager
            inputs.nixos-cosmic.nixosModules.default
            inputs.stylix.nixosModules.stylix
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.hiimkobeand = import ./hosts/desktop/home.nix;
                extraSpecialArgs = { inherit inputs; };
                backupFileExtension = "hm-backup-ext";
              };
            }
          ];
        };
        server = nixpkgs.lib.nixosSystem {
          modules = [
            ./modules/application/terminal-utils.nix
            ./modules/system/package.nix
            ./hosts/server/configuration.nix
            ./services/cloudflared.nix
            ./services/pufferpanel.nix

            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.server = import ./hosts/server/home.nix;
                extraSpecialArgs = { inherit inputs; };
                backupFileExtension = "hm-backup";
              };
            }
          ];
        };
      };
    };
}
