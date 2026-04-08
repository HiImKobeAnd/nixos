{ self, inputs, ... }:
{
  flake.nixosModules.hyprland =
    { pkgs, ... }:
    {
      environment.sessionVariables.NIXOS_OZONE_WL = 1;
      environment.systemPackages = with pkgs; [
        hyprlauncher
        hyprshutdown
        kdePackages.dolphin
        waybar
        hyprpaper
        noctalia-shell
      ];
      programs.hyprland = {
        enable = true;
        withUWSM = true;
        # package = self.packages.${pkgs.stdenv.hostPlatform.system}.myHyprland;
      };
      programs.hyprlock.enable = true;
      services.hypridle.enable = true;
      services.dunst.enable = true;
      services.displayManager.sddm = {
        enable = true;
        wayland = {
          enable = true;
        };
      };
    };

  perSystem =
    { pkgs, lib, ... }:
    {
      packages.myHyprland = inputs.wrapper-modules.lib.wrap {
        inherit pkgs;
        name = "hyprland";
        package = pkgs.hyprland;

        backend = "shell";

        flags = [
          "--add-flags"
          "-c"
          "--add-flags"
          "${../../hyprland.conf}"
        ];

        drv = {
          postBuild = "ln -s ${pkgs.hyprland}/share $out/share";
        };
      };
    };
}
