{ self, ... }:
{
  flake.nixosModules.server0Configuration =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      imports = [
        self.nixosModules.server0Hardware
        self.nixosModules.default-locale
        self.nixosModules.default-fonts
        self.nixosModules.basic-terminal-tools
        self.nixosModules.git
        self.nixosModules.nvf
      ];

      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      networking.hostName = "server0"; # Define your hostname.

      networking.networkmanager.enable = true;

      services.displayManager.gdm.enable = true;
      services.desktopManager.gnome.enable = true;

      # Configure keymap in X11
      services.xserver.xkb = {
        layout = "dk";
        variant = "";
      };

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
      };
      nixpkgs.config.allowUnfree = true;
      services.openssh.enable = true;
      system.stateVersion = "26.05"; # Did you read the comment?
    };
}
