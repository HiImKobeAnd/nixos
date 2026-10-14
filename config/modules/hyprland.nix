{ inputs, ... }:
{
  flake.nixosModules.hyprland =
    { pkgs, ... }:
    {
      nixpkgs.overlays = [
        inputs.noctalia.overlays.default
      ];
      environment.sessionVariables = {
        NIXOS_OZONE_WL = 1;
        HY3_PATH = "${pkgs.hyprlandPlugins.hy3}/lib/libhy3.so";
      };
      environment.systemPackages = with pkgs; [
        cosmic-files # File manager GUI
        wl-clipboard # Clipboard
        ddcutil # For external monitor brightness applet
        hyprlandPlugins.hy3 # Hyprland plugin to make tiling feel like Cosmic DE
        noctalia
        hyprcursor # For cursors
        rose-pine-hyprcursor # For cursors
        pulseaudio # For Noctalia plugin: Audio Switcher
      ];
      programs.hyprland = {
        enable = true;
        withUWSM = true;
        # package = self.packages.${pkgs.stdenv.hostPlatform.system}.myHyprland;
      };
      services = {
        power-profiles-daemon.enable = true; # Noctalia dependency
        upower.enable = true; # Noctalia dependency
        greetd = {
          enable = true;
          settings = {
            initial_session = {
              command = "uwsm start hyprland-uwsm.desktop";
              user = "hiimkobeand";
            };
            default_session = {
              command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd 'uwsm start hyprland.desktop";
              user = "greeter";
            };
          };
        };
        gnome.gnome-keyring.enable = true;
      };
    };
}
