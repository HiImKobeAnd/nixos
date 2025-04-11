{ ... }:
{
  imports = [
    ../../homeModules/git.nix
    ../../homeModules/nixvim.nix
    ../../homeModules/fish.nix
    ../../homeModules/misc.nix
  ];
  home = {
    username = "server";
    homeDirectory = "/home/server";
    stateVersion = "24.11";
  };
  programs = {
    home-manager.enable = true;
  };
}
