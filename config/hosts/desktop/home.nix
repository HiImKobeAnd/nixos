{
  home-manager,
  nixpkgs,
  ...
}:
{
  flake.homeConfigurations.hiimkobeand = home-manager.lib.homeManagerConfiguration {
    pkgs = import nixpkgs { system = "x86_64-linux"; };
    modules = [
      ../../../homeModules/nixvim
      ../../../homeModules/cosmic.nix

      {
        home.username = "hiimkobeand";
        home.homeDirectory = "/home/hiimkobeand";
        home.stateVersion = "24.05";
      }
    ];
    useGlobalPkgs = true;
    userUserPackages = true;
    #
    #   imports = [
    #     ../../homeModules/nixcord.nix
    #     ../../homeModules/git.nix
    #     ../../homeModules/fish.nix
    #     ../../homeModules/misc.nix
    #     ../../homeModules/cosmic.nix
    #     # ../../homeModules/plasma.nix
    #     # ../../homeModules/helix.nix
    #     ../../homeModules/nixvim
    #   ];
    #   home = {
    #     username = "hiimkobeand";
    #     homeDirectory = "/home/hiimkobeand";
    #     stateVersion = "24.05";
    #   };
    #   programs = {
    #     home-manager.enable = true;
    #   };
  };
}
