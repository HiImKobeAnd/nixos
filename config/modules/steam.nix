{ inputs, ... }:
{
  flake.nixosModules.steam =
    { pkgs, ... }:
    {
      nixpkgs.overlays = [
        inputs.millennium.overlays.default
      ];
      environment.systemPackages = with pkgs; [
        gamemode
        protonplus
      ];

      programs = {
        steam = {
          enable = true;
          package = pkgs.millennium-steam;
          gamescopeSession.enable = true;
          remotePlay.openFirewall = true;
        };
        gamemode.enable = true;
      };
    };
}
