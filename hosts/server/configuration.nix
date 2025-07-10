{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];
  # Setup
  config = {
    modules = {
      services = {
        ssh.enable = true;
        cloudflared.enable = true;
        docker.enable = true;
        tandoor.enable = true;
      };
    };

    # Nixpkgs
    nixpkgs.config.allowUnfree = true;

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Networking
    networking.hostName = "nixos";
    networking.networkmanager.enable = true;

    # User
    users.users.server = {
      isNormalUser = true;
      description = "Kobe Andersen";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
      ];
    };

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    system.stateVersion = "24.11";
  };
}
