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
        xcursor-pro
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
      services.dunst.enable = true; # Notification daemon
      programs.regreet = {
        # Greeter
        enable = true;
        cageArgs = [
          "-s"
          "-m"
          "last"
        ];
        settings = {
          background = {
            path = "../../background-image.jpg";
            fit = "Contain";
          };
          GTK = {
            application_prefer_dark_theme = true;
          };
        };
      };
      services.gnome.evolution-data-server.enable = true; # For calendar support
      services.gnome.gnome-keyring.enable = true; # For calendar support
      services.ddccontrol.enable = true; # For external monitor brightness applet
    };

  perSystem =
    { pkgs, lib, ... }:
    {
      # packages.myHyprland = inputs.wrapper-modules.lib.wrapPackage {
      #   inherit pkgs;
      #   package = pkgs.hyprland;
      #
      #   env = {
      #     HYPRLAND_PLUGINS = {
      #       value = pkgs.lib.makeSearchPathOutput "lib" "" [
      #         pkgs.hyprlandPlugins.hy3
      #       ];
      #       method = "set";
      #     };
      #   };
      #
      #   flags = {
      #
      #     "-c" = "${../non-nix/hyprland.conf}";
      #   };
      #
      #   drv = {
      #     postBuild = "ln -s ${pkgs.hyprland}/share $out/share";
      #   };
      # };
      packages.myNoctaliaShell = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
        inherit pkgs;
        settings = (builtins.fromJSON (builtins.readFile ../non-nix/nocatalia-shell.json)).settings;
      };
    };
}
