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
      gnomeExtensions.paperwm
      gnomeExtensions.tray-icons-reloaded
    ];
    environment.gnome.excludePackages = [
      pkgs.geary
    ];
  };
}
