{ ... }:
{
  imports = [
    ../../homeModules/git.nix
    ../../homeModules/fish.nix
    ../../homeModules/misc.nix
    ../../homeModules/nixvim
  ];
  home = {
    username = "wsl";
    homeDirectory = "/home/wsl";
    stateVersion = "25.05";
  };
  programs = {
    home-manager.enable = true;
  };
}
