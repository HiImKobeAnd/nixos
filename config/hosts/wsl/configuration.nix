{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.wslConfiguration = {pkgs, ...}: {
    imports = [
      # System
      inputs.nixos-wsl.nixosModules.default
      self.nixosModules.default-locale
      self.nixosModules.default-fonts

      # Terminal
      self.nixosModules.basic-terminal-tools
      self.nixosModules.terminal
      self.nixosModules.nix-tools
      self.nixosModules.fish
      self.nixosModules.git
      self.nixosModules.comma

      # Applications
      self.nixosModules.nvf

      # Services
      # self.nixosModules.docker
    ];

    environment.systemPackages = with pkgs; [pulseaudio];

    # Sound
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    environment.sessionVariables = {
      PULSE_SERVER = "unix:/mnt/wslg/PulseServer";
    };

    environment.etc = {
      "asound.conf".text = ''
          pcm.!default {
          type pulse
          server /run/user/1000/pulse/native
        }
        ctl.!default {
          type pulse
          server /run/user/1000/pulse/native
        }
      '';
    };

    nix = {
      settings = {
        substituters = [
          "https://nix-community.cachix.org"
        ];
        trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];
        auto-optimise-store = true;
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
      optimise.automatic = true;
    };

    # Maintenance

    # Nixpkgs
    nixpkgs.config.allowUnfree = true;

    # WSL
    wsl.enable = true;
    wsl.defaultUser = "wsl";

    system.stateVersion = "25.05";
  };
}
