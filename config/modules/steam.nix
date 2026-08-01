{ inputs, ... }:
{
  flake.nixosModules.steam =
    { pkgs, ... }:
    let
      prPkgs = import inputs.nixpkgs-millennium {
        system = pkgs.stdenv.hostPlatform.system;
        config.allowUnfree = true;
      };
    in
    {
      environment.systemPackages = with pkgs; [
        gamemode
        protonplus
      ];

      programs = {
        steam = {
          enable = true;
          package = prPkgs.steam.override {
            withMillennium = true;
          };
          gamescopeSession.enable = true;
          remotePlay.openFirewall = true;
        };
        gamemode.enable = true;
      };
    };
}
