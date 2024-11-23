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
      prismlauncher
      heroic
      gamemode
      xivlauncher
      #parsec-bin
      protonup-qt
    ];
    programs = {
      steam.enable = true;
      steam.remotePlay.openFirewall = true;

      sleepy-launcher.enable = true;
      honkers-railway-launcher.enable = true;
    };
  };
}
