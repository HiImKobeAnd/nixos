{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf (config.modules.desktop == "kde") {
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
    services.desktopManager.plasma6.enable = true;

    xdg.portal.enable = true;
    xdg.portal.extraPortals = with pkgs; [ kdePackages.xdg-desktop-portal-kde ];
    environment.systemPackages = with pkgs; [
    ];
  };
}
