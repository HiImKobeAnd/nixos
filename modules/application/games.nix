{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    games.enable = lib.mkEnableOption "enables games, steam, lutris, etc";
  };

  config = lib.mkIf config.games.enable {
    environment.systemPackages = with pkgs; [
      steam
      #heroic
      #lutris
      #gamemode
      xivlauncher
      #osu-lazer
      #path-of-building
      #parsec-bin
      #protonup-qt
      #protontricks
      mcaselector
      (prismlauncher.override {
        additionalPrograms = [ffmpeg];
        jdks = [
          temurin-bin
        ];
      })
    ];
    programs = {
      steam.enable = true;
      steam.gamescopeSession.enable = true;
      steam.remotePlay.openFirewall = true;

      honkers-railway-launcher.enable = true;
      anime-games-launcher.enable = true;
    };
    hardware.steam-hardware.enable = true;
  };
}
