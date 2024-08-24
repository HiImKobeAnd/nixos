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
      lutris
      steam
      steam-tui
      prismlauncher
      heroic
      gamemode
      parsec-bin
    ];
    programs.steam.enable = true;
    programs.steam.remotePlay.openFirewall = true;

    programs.sleepy-launcher.enable = true;
    programs.honkers-railway-launcher.enable = true;
  };
}
