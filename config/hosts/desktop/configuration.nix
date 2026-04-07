{ self, ... }:
{
  flake.nixosModules.desktopConfiguration =
    {
      pkgs,
      lib,
      config,
      # inputs,
      ...
    }:
    {
      imports = [
        # System
        self.nixosModules.desktopHardware
        self.nixosModules.keyboard-rebinds
        self.nixosModules.default-locale
        self.nixosModules.default-fonts
        self.nixosModules.controllers
        self.nixosModules.nvidia

        # Terminal
        self.nixosModules.basic-terminal-tools
        self.nixosModules.dev-terminal-tools
        self.nixosModules.nix-tools
        self.nixosModules.fish

        # Services
        self.nixosModules.syncthing
        self.nixosModules.docker
        self.nixosModules.flatpak

        # Applications
        self.nixosModules.cosmic-de
        self.nixosModules.vm
        self.nixosModules.librewolf
        self.nixosModules.waydroid
        self.nixosModules.steam
        self.nixosModules.minecraft
        self.nixosModules.other-games
        self.nixosModules.hobby-applications
        self.nixosModules.chromium
        self.nixosModules.social-media
        self.nixosModules.obs-studio
        self.nixosModules.audio-applications
        self.nixosModules.learning
        self.nixosModules.music
        self.nixosModules.email
        self.nixosModules.office-suite
        self.nixosModules.nixcord
        self.nixosModules.nixvim

        # Home Manager
        # inputs.home-manager.flakeModules.home-manager
        # self.homeConfigurations.hiimkobeand
      ];
      nix.settings = {
        substituters = [
          "https://nix-community.cachix.org"
        ];
        trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];
      };

      # Maintenance
      nix.optimise.automatic = true;
      nix.settings.auto-optimise-store = true;

      # Sound
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        pulse.enable = true;
      };

      # Bootloader
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.extraModulePackages = with config.boot.kernelPackages; [
        # rtl8852bu # For Asus AX55 nano wifi dongle
        ddcci-driver # For backlight control
      ];

      # For backlight control
      services.udev.extraRules =
        let
          bash = "${pkgs.bash}/bin/bash";
          ddcciDev = "NVIDIA i2c adapter 5 at 1:00.0";
          ddcciNode = "sys/bus/i2c/devices/i2c-14/new_device";
        in
        ''
          SUBSYSTEM=="i2c", ACTION=="add", ATTR{name}=="${ddcciDev}", RUN+="${bash} -c 'sleep 30; printf ddcci\ 0x37 > ${ddcciNode}'"
        '';

      # Bluetooth
      hardware.bluetooth.enable = true;

      # Networking
      networking.hostName = "hiimkobeand";
      networking.networkmanager.enable = true;
      networking.networkmanager.wifi.powersave = false;

      # Nixpkgs
      nixpkgs.config.allowUnfree = true;

      # User
      users.users.hiimkobeand = {
        isNormalUser = true;
        description = "Kobe Andersen";
        extraGroups = [
          "networkmanager"
          "wheel"
          "libvirtd"
          "docker"
          "i2c" # For backlight control
        ];
      };

      virtualisation.libvirtd.enable = true;

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      system.stateVersion = "24.05";
    };

}

# Setup
# config = {
#   modules = {
#     desktop = "cosmic";
#     sound.enable = true;
#     fonts.enable = true;
#     nvidia.enable = true;
#     applications = {
#       essentials.enable = true;
#       games.enable = true;
#       librewolf.enable = true;
#       quickemu.enable = true;
#       waydroid.enable = true;
#       # blender.enable = true;
#       misc.enable = true;
#     };
#     services = {
#       keyd.enable = true;
#       controllers.enable = true;
#       misc.enable = true;
#       syncthing.enable = true;
#       docker.enable = true;
#       screen-powerstate-services.enable = true;
#       # ollama.enable = true;
#     };
#   };
#   services.flatpak.enable = true;
