{ self, inputs, ... }:
{
  flake.nixosModules.hyprland =
    { pkgs, ... }:
    {
      environment.sessionVariables.NIXOS_OZONE_WL = 1;
      environment.systemPackages = with pkgs; [
        cosmic-files
        playerctl # For music control
        evolution # For calendar support
        wl-clipboard
        grim # For screenshot
        slurp # For screenshot
        ddcutil # For external monitor brightness applet
        (noctalia-shell.override {
          calendarSupport = true; # For calendar support
          ddcutilSupport = true; # For external monitor brightness applet
        })
        # (self.packages.${pkgs.stdenv.hostPlatform.system}.myNoctalia-shell.override {
        # calendarSupport = true; # For calendar support
        # ddcutilSupport = true; # For external monitor brightness applet
        #})
      ];
      programs.hyprland = {
        enable = true;
        withUWSM = true;
        # package = self.packages.${pkgs.stdenv.hostPlatform.system}.myHyprland;
      };
      programs.hyprlock.enable = true;
      services.hypridle.enable = true;
      services.dunst.enable = true;
      programs.regreet.enable = true;
      services.gnome.evolution-data-server.enable = true; # For calendar support
      services.gnome.gnome-keyring.enable = true; # For calendar support
      services.ddccontrol.enable = true; # For external monitor brightness applet
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
      packages.myNoctaliaShell = inputs.wrapper-modules.lib.wrap {
        inherit pkgs;
        name = "noctalia-shell";
        package = pkgs.noctalia-shell;

        backend = "shell";

        flags = [
          "--add-flags"
          "-c"
          "--add-flags"
          "${../non-nix/nocatalia-shell.json}"
        ];

        drv = {
          postBuild = "ln -s ${pkgs.noctalia-shell}/share $out/share";
        };
      };
    };
}
