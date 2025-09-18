{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf (config.modules.desktop == "gnome") {
    services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      gnome.core-apps.enable = true;
    };
    environment.systemPackages = with pkgs; [
      gnomeExtensions.pop-shell
      gnomeExtensions.tray-icons-reloaded
    ];
    # environment.gnome.excludePackages = with pkgs; [
    # geary
    # gnome-music
    # epiphany
    # gnome-tour
    # yelp
    # simple-scan
    # gnome-system-monitor
    # ];
  };
}
