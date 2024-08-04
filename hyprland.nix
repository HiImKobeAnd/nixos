{pkgs, ...}: {
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # Hints to electron apps that wayland is in use.

  environment.systemPackages = with pkgs; [
    pyprland
    hyprpaper
    xwayland

    alacritty
  ];
}
