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
      protontricks
    ];
    programs = {
      steam.enable = true;
      steam.remotePlay.openFirewall = true;

      honkers-railway-launcher.enable = true;
      an-anime-game-launcher.enable = true;
    };
    hardware.steam-hardware.enable = true;
  };
}
