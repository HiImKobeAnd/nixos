{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    gnome.enable = lib.mkEnableOption "enable gnome";
  };
  config = lib.mkIf config.gnome.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.wayland = false;
    };
    programs.kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };

    environment.systemPackages = with pkgs; [
      gnomeExtensions.pop-shell
      gnomeExtensions.pop-launcher-super-key
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
