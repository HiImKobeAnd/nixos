{ ... }:
{
  imports = [
    ../../homeModules/nixcord.nix
    ../../homeModules/git.nix
    ../../homeModules/fish.nix
    ../../homeModules/misc.nix
    ../../homeModules/cosmic.nix
    # ../../homeModules/helix.nix
    ../../homeModules/nixvim
  ];
  home = {
    username = "hiimkobeand";
    homeDirectory = "/home/hiimkobeand";
    stateVersion = "24.05";
  };
  programs = {
    home-manager.enable = true;
  };
}
