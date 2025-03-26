{ ... }:
{
  imports = [
    ../../homeModules/git.nix
    ../../homeModules/fish.nix
    ../../homeModules/misc.nix
  ];
  home = {
    username = "server";
    homeDirectory = "/home/server";
    stateVersion = "24.05";
  };
  programs = {
    home-manager.enable = true;
  };
}
