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
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:ch4og/zen-browser-flake";
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./nixosModules
        ./hosts/desktop/configuration.nix

        ./terminal-utils.nix
        {
          nix.settings = {
            substituters = ["https://cosmic.cachix.org/" "https://ezkea.cachix.org"];
            trusted-public-keys = ["cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="];
          };
        }

        home-manager.nixosModules.home-manager
        inputs.stylix.nixosModules.stylix
        inputs.nixos-cosmic.nixosModules.default
        inputs.aagl.nixosModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.hiimkobeand = import ./home/home.nix;
            extraSpecialArgs = {inherit inputs;};
          };
        }
      ];
    };
  };
}
