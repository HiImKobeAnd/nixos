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
      prismlauncher
      heroic
      airshipper
      gamemode
      parsec-bin
    ];
    programs = {
      steam.enable = true;
      steam.remotePlay.openFirewall = true;

      sleepy-launcher.enable = true;
      honkers-railway-launcher.enable = true;
    };
  };
}
