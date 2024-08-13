{
  description = "hiimkobeand's nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord.url = "github:kaylorben/nixcord";
    stylix.url = "github:danth/stylix";
    rust-overlay.url = "github:oxalica/rust-overlay";
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixos-cosmic,
    ...
  } @ inputs: let
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./system/bootloader.nix
        ./system/networking.nix
        ./system/sound.nix
        ./system/users.nix
        ./system/nix-settings.nix
        ./system/nvidia.nix
        ./system/fonts.nix
        ./system/auto-upgrade.nix
        ./system/bluetooth.nix

        ./system/hardware-configuration.nix
        ./system/configuration.nix
        ./system/locale.nix

        ./gnome.nix
        #./cosmic-de.nix
        #./hyprland.nix
        ./applications.nix
        ./terminal-utils.nix
        ./services.nix
        ./development.nix
        ./theme.nix

        {
          nix.settings = {
            substituters = ["https://cosmic.cachix.org/"];
            trusted-public-keys = ["cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="];
          };
        }

        inputs.stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        nixos-cosmic.nixosModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.hiimkobeand = import ./home/home.nix;

            sharedModules = [
              inputs.nixcord.homeManagerModules.nixcord
            ];
          };
        }
      ];
    };
  };
}
