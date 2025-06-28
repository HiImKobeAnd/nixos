# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ ... }:

{
  imports = [
    ../../modules
  ];
  # Config
  modules.fonts.enable = false;
  modules.services.docker.enable = true;

  # User
  users.users.hiimkobeand = {
    isNormalUser = true;
    description = "Kobe Andersen";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
    ];
  };

  # Nixpkgs
  nixpkgs.config.allowUnfree = true;

  wsl.enable = true;
  wsl.defaultUser = "wsl";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "24.11";
}
