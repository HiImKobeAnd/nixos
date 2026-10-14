{ self, ... }:
{
  flake.nixosModules.server0Configuration =
    { ... }:
    {
      imports = [
        self.nixosModules.server0Hardware
        self.nixosModules.default-locale
        self.nixosModules.default-fonts
        self.nixosModules.basic-terminal-tools
        self.nixosModules.git
        self.nixosModules.nvf
        self.nixosModules.ssh
        self.nixosModules.gnome
        self.nixosModules.nix-tools
      ];

      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      networking.hostName = "server0";

      networking.networkmanager.enable = true;

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

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

      nixpkgs.config.allowUnfree = true;

      system.stateVersion = "26.05";
    };
}
