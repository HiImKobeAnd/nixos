{ ... }:
{
  imports = [
    ../../homeModules/git.nix
    ../../homeModules/fish.nix
    ../../homeModules/misc.nix
    ../../homeModules/helix.nix
    ../../homeModules/zellij.nix
  ];
  home = {
    username = "wsl";
    homeDirectory = "/home/wsl";
    stateVersion = "24.11";
  };
  programs = {
    home-manager.enable = true;
  };
}
