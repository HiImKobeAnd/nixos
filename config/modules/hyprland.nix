{ self, inputs, ... }:
{
  flake.nixosModules.hyprland =
    { pkgs, ... }:
    {
      environment.sessionVariables.NIXOS_OZONE_WL = 1;
      environment.systemPackages = with pkgs; [
        anyrun
        hyprshutdown
        kdePackages.dolphin
        cosmic-files
        evolution
        (noctalia-shell.override {
          calendarSupport = true;
          brightnessctlSupport = true;
        })
        # self.packages.${pkgs.stdenv.hostPlatform.system}.myWaybar
      ];
      programs.hyprland = {
        enable = true;
        withUWSM = true;
        # package = self.packages.${pkgs.stdenv.hostPlatform.system}.myHyprland;
      };
      programs.evolution.enable = true;
      programs.hyprlock.enable = true;
      services.hypridle.enable = true;
      services.dunst.enable = true;
      services.displayManager.sddm = {
        enable = true;
        wayland = {
          enable = true;
        };
      };
      services.gnome.evolution-data-server.enable = true;
      services.gnome.gnome-online-accounts.enable = true;
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
          "${../non-nix/hyprland.conf}"
        ];

        drv = {
          postBuild = "ln -s ${pkgs.hyprland}/share $out/share";
        };
      };
      # packages.myWaybar = inputs.wrapper-modules.lib.wrap {
      #   inherit pkgs;
      #   name = "waybar";
      #   package = pkgs.waybar;
      #
      #   backend = "shell";
      #
      #   flags = [
      #     "--add-flags"
      #     "-c"
      #     "--add-flags"
      #     "${../non-nix/waybar.jsonc}"
      #   ];
      #
      #   drv = {
      #     postBuild = "ln -s ${pkgs.waybar}/share $out/share";
      #   };
      # };
    };
}
