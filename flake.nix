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
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    aagl,
    ...
  } @ inputs: let
    system = "x86_64-linux";
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

        ./system/hardware-configuration.nix
        ./system/configuration.nix
        ./system/locale.nix

        ./gnome.nix
        # ./hyprland.nix
        ./applications.nix
        ./terminal-utils.nix
        ./services.nix
        ./development.nix
        ./theme.nix
        inputs.stylix.nixosModules.stylix
        aagl.nixosModules.default

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.hiimkobeand = import ./home/home.nix;

          home-manager.sharedModules = [
            inputs.nixcord.homeManagerModules.nixcord
          ];
        }
      ];
    };
  };
}
