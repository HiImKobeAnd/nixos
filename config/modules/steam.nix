{ ... }:
{
  flake.nixosModules.steam =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        gamemode
        protonplus
      ];

      programs = {
        steam = {
          enable = true;
          gamescopeSession.enable = true;
          remotePlay.openFirewall = true;
        };
        gamemode.enable = true;
      };
      services.wivrn = {
        enable = true;
        openFirewall = true;
        package = (pkgs.wivrn.override { cudaSupport = true; });
      };
    };
}
