{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    games.enable = lib.mkEnableOption "enables games, steam, lutris, etc";
  };

  config = lib.mkIf config.games.enable {
    environment.systemPackages = with pkgs; [
      steam
      #heroic
      lutris
      wine
      #gamemode
      xivlauncher
      runelite
      #osu-lazer
      #path-of-building
      #parsec-bin
      #protonup-qt
      #protontricks
      mcaselector
      (prismlauncher.override {
        additionalPrograms = [ ffmpeg ];
        jdks = [
          temurin-bin
          temurin-jre-bin-17
        ];
      })
    ];
    programs = {
      steam.enable = true;
      steam.gamescopeSession.enable = true;
      steam.remotePlay.openFirewall = true;
    };
    hardware.steam-hardware.enable = true;
  };
}
