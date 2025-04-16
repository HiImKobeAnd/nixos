{ config, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];
  # Setup
  config.modules = {
    desktop = "cosmic";
    sound = true;
    nvidia = true;
    applications = {
      essentials = true;
      games = true;
      librewolf = true;
      quickemu = true;
      waydroid = true;
      misc = true;
    };
  };
  # Nixpkgs
  nixpkgs.config.allowUnfree = true;

  # Bluetooth
  hardware.Bluetooth.enable = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

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

  virtualisation.libvirtd.enable = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "24.05";
}
