{ self, inputs, ... }:
{
  flake.nixosModules.hyprland =
    { pkgs, ... }:
    {
      environment.sessionVariables.NIXOS_OZONE_WL = 1;
      environment.systemPackages = with pkgs; [
      ];
      programs.hyprland = {
        enable = true;
        withUWSM = true;
        # package = self.packages.${pkgs.stdenv.hostPlatform.system}.myHyprland;
      };
      programs.hyprlock.enable = true;
      services.hypridle.enable = true;
    };

  perSystem =
    { pkgs, lib, ... }:
    let
      hyprConfig = ''

      '';
      configFile = pkgs.writeText "hyprland.conf" hyprConfig;
    in
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
          "${configFile}"
        ];

        drv = {
          postBuild = "ln -s ${pkgs.hyprland}/share $out/share";
        };
      };
    };
}
