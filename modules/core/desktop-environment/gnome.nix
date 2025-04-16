{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf (config.modules.desktop == "gnome") {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.wayland = true;
    };
    environment.systemPackages = with pkgs; [
      gnomeExtensions.pop-shell
      gnomeExtensions.tray-icons-reloaded
    ];
    environment.gnome.excludePackages = with pkgs; [
      geary
      evince
      cheese
      gnome-music
      gnome-terminal
      epiphany
      gnome-tour
      yelp
      simple-scan
      gnome-system-monitor
      gnome-maps
    ];
  };
}
