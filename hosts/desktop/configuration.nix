{ config, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];
  # Setup
  config.modules = {
    desktop = "cosmic";
    sound.enable = true;
    nvidia.enable = true;
    applications = {
      essentials.enable = true;
      games.enable = true;
      librewolf.enable = true;
      quickemu.enable = true;
      waydroid.enable = true;
      misc.enable = true;
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
