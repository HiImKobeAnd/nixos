{ ... }:
{
  flake.nixosModules.steam =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        steam
        gamemode
        protonup-rs
      ];
      programs = {
        steam = {
          enable = true;
          gamescopeSession.enable = true;
          remotePlay.openFirewall = true;
          # package = pkgs.steam.override {
          #   extraEnv = {
          #     GAMEMODERUN = "1";
          #     PULSE_LATENCY_MSEC = "30";
          #   };
          # };
        };
        gamemode.enable = true;
      };
    };
}
