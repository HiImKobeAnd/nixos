{ inputs, ... }:
{
  imports = [
    inputs.cosmic-manager.homeManagerModules.cosmic-manager
  ];
  programs.cosmic-manager.enable = true;
  wayland.desktopManager.cosmic = {
    enable = true;
    appearance.theme.mode = "dark";
  };
}
