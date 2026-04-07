{ self, ... }:
{
  flake.nixosModules.wslConfiguration =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    {
      imports = [
        # System
        self.nixosModules.default-locale
        self.nixosModules.default-fonts

        # Terminal
        self.nixosModules.basic-terminal-tools
        self.nixosModules.dev-terminal-tools
        self.nixosModules.nix-tools
        self.nixosModules.fish

        # Services
        # self.nixosModules.docker
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

      # Nixpkgs
      nixpkgs.config.allowUnfree = true;

      # WSL
      wsl.enable = true;
      wsl.defaultUser = "wsl";

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      system.stateVersion = "25.05";
    };
}
