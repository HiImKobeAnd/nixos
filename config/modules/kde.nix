_: {
  flake.nixosModules.kde = {pkgs, ...}: {
    services = {
      displayManager.sddm.enable = true;
      displayManager.sddm.wayland.enable = true;
      desktopManager.plasma6.enable = true;
    };

    xdg.portal.enable = true;
    xdg.portal.extraPortals = with pkgs; [kdePackages.xdg-desktop-portal-kde];
  };
}
