{pkgs, ...}: {
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # Hints to electron apps that wayland is in use.

  services.greetd = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    pyprland
    hyprpaper
    xwayland

    kitty
    tofi
    alacritty
  ];
}
