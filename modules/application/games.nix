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
      xdg-desktop-portal-gtk
    ];
    programs = {
      steam.enable = true;
      steam.remotePlay.openFirewall = true;

      honkers-railway-launcher.enable = true;
      anime-games-launcher.enable = true;
    };
    hardware.steam-hardware.enable = true;
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [xdg-desktop-portal-gtk];
    };
  };
}
