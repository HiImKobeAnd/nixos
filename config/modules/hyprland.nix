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
        (noctalia.override {
          cudaSupport = true;
        })
        hyprcursor # For cursors
        rose-pine-hyprcursor # For cursors
      ];
      programs.hyprland = {
        enable = true;
        withUWSM = true;
        # package = self.packages.${pkgs.stdenv.hostPlatform.system}.myHyprland;
      };
      # programs.regreet = {
      #   # Greeter
      #   enable = true;
      #   cageArgs = [
      #     "-s"
      #     "-m"
      #     "last"
      #   ];
      # };
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
              command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd 'uwsm start hyprland.desktop";
              user = "greeter";
            };
          };
        };
      };
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
