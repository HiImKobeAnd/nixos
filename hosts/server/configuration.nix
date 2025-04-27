{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];
  # Setup
  config = {
    modules = {
      desktop = "gnome";
      services = {
        matrix.enable = true;
        ssh.enable = true;
        pufferpanel.enable = true;
      };
    };
    services.cloudflared.enable = true;

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
      ];
    };

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    system.stateVersion = "24.11";
  };
}
