{ self, ... }:
{
  flake.nixosModules.desktopConfiguration =
    {
      pkgs,
      lib,
      config,
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
        self.nixosModules.scx-scheduler

        # Terminal
        self.nixosModules.basic-terminal-tools
        self.nixosModules.terminal
        self.nixosModules.nix-tools
        self.nixosModules.fish
        self.nixosModules.git
        self.nixosModules.comma

        # Services
        self.nixosModules.syncthing
        self.nixosModules.docker
        self.nixosModules.flatpak

        # Applications
        self.nixosModules.hyprland
        # self.nixosModules.vm
        self.nixosModules.waydroid
        self.nixosModules.steam
        self.nixosModules.minecraft
        self.nixosModules.games
        self.nixosModules.hobby-applications
        self.nixosModules.social-media
        self.nixosModules.obs-studio
        self.nixosModules.learning
        self.nixosModules.music
        self.nixosModules.office-suite
        self.nixosModules.nixcord
        self.nixosModules.nixvim
        self.nixosModules.nvf
        self.nixosModules.blender
        self.nixosModules.vlc
        self.nixosModules.helium
        self.nixosModules.aicode
        self.nixosModules.python
      ];

      # Fix for https://github.com/NixOS/nixpkgs/issues/536623
      nixpkgs.overlays = [
        (final: prev: {
          pnpm_10_29_2 = final.pnpm_10;
          electron_40 = final.electron_41;
          # HACK 2026/07/27 fix see https://github.com/NixOS/nixpkgs/issues/545409.
          # Can be removed when https://github.com/NixOS/nixpkgs/pull/545542 is merged.
          openimagedenoise = prev.openimagedenoise.overrideAttrs (old: {
            buildInputs = (old.buildInputs or [ ]) ++ [ final.cudaPackages.cuda_nvcc ];
          });
        })
      ];

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
        v4l2loopback
      ];

      boot.blacklistedKernelModules = [
        "ucsi_ccg" # Stops my DGPU from trying to load USB C Drivers which should result in faster startup
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
      systemd.services.NetworkManager-wait-online.enable = false;

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

      hardware.i2c.enable = true;

      virtualisation.libvirtd.enable = true;
      virtualisation.libvirtd.onBoot = "ignore";
      systemd.services.libvirtd = {
        after = [ "graphical.target" ];
        wantedBy = lib.mkForce [ "graphical.target" ];
      };

      # Nixpkgs
      nixpkgs.config.allowUnfree = true;
      nix.settings = {
        substituters = [
          "https://nix-community.cachix.org"
        ];
        trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];
      };

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      system.stateVersion = "24.05";
    };
}
