{ ... }:
{
  flake.nixosModules.gnome =
    { pkgs, ... }:
    {
      services = {
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
        gnome.core-apps.enable = true;
      };
      environment.systemPackages = with pkgs; [
        gnomeExtensions.pop-shell
        gnomeExtensions.tray-icons-reloaded
      ];
    };
}
