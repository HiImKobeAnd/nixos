{
  description = "hiimkobeand's nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord.url = "github:KaylorBen/nixcord";
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    cosmic-manager = {
      url = "github:HeitorAugustoLN/cosmic-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations = {
        hiimkobeand = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/desktop/configuration.nix

            inputs.home-manager.nixosModules.home-manager
            inputs.nixos-cosmic.nixosModules.default
            inputs.aagl.nixosModules.default
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
            ./hosts/server/configuration.nix

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
        wsl = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/wsl/configuration.nix

            inputs.nixos-wsl.nixosModules.default
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.wsl = import ./hosts/wsl/home.nix;
                extraSpecialArgs = { inherit inputs; };
                backupFileExtension = "hm-backup";
              };
            }
          ];
        };
      };
    };
}
