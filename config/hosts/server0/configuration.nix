{ self, ... }:
{
  flake.nixosModules.server0Configuration =
    { ... }:
    {
      imports = [
        self.nixosModules.server0Hardware
        self.nixosModules.default-locale
        self.nixosModules.ssh
        self.nixosModules.nextcloud
        self.nixosModules.headscale
        self.nixosModules.tailscale
      ];

      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      networking.hostName = "server0";

      networking.networkmanager.enable = true;

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
      nix.settings.trusted-users = [ "@wheel" ];

      users.users."server0" = {
        isNormalUser = true;
        description = "server0";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKtL57ynKkB4Sul/DcDwKIX8oYEhHb3OcpWpSxEdbj5B"
        ];
      };

      security.sudo.extraRules = [
        {
          groups = [ "wheel" ];
          commands = [
            {
              command = "ALL";
              options = [ "NOPASSWD" ];
            }
          ];
        }
      ];

      nixpkgs.config.allowUnfree = true;

      system.stateVersion = "26.05";
    };
}
