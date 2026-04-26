{ self, inputs, ... }:
{
  flake.nixosModules.hyprland =
    { pkgs, ... }:
    {
      environment.sessionVariables = {
        NIXOS_OZONE_WL = 1;
        HY3_PATH = "${pkgs.hyprlandPlugins.hy3}/lib/libhy3.so";
      };
      environment.systemPackages = with pkgs; [
        cosmic-files # File manager GUI
        playerctl # For music control
        evolution # For calendar support
        wl-clipboard # Clipboard
        grim # For screenshot
        slurp # For screenshot
        ddcutil # For external monitor brightness applet
        hyprlandPlugins.hy3 # Hyprland plugin to make tiling feel like Cosmic DE
        (noctalia-shell.override {
          calendarSupport = true; # For calendar support
          ddcutilSupport = true; # For external monitor brightness applet
        })
        # (self.packages.${pkgs.stdenv.hostPlatform.system}.myNoctalia-shell.override {
        # calendarSupport = true; # For calendar support
        # ddcutilSupport = true; # For external monitor brightness applet
        #})
        hyprcursor # For cursors
        rose-pine-hyprcursor # For cursors
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
          # background = {
          # path = "../../background-image.jpg";
          # fit = "Contain";
          # };
          # GTK = {
          #   application_prefer_dark_theme = true;
          # };
        };
      };
      services.gnome.evolution-data-server.enable = true; # For calendar support
      services.gnome.gnome-keyring.enable = true; # For calendar support
      services.ddccontrol.enable = true; # For external monitor brightness applet
    };

  perSystem =
    { pkgs, lib, ... }:
    {
      packages.myHyprland = inputs.wrapper-modules.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.hyprland;

        flags = {

          "-c" = "${../non-nix/hyprland.conf}";
        };

        drv = {
          postBuild = "ln -s ${pkgs.hyprland}/share $out/share";
        };
      };
      packages.myNoctaliaShell = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
        inherit pkgs;
        settings = (builtins.fromJSON (builtins.readFile ../non-nix/nocatalia-shell.json)).settings;
      };
    };
}
