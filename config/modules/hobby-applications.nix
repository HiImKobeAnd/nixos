{ ... }:
{
  flake.nixosModules.hobby-applications =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        krita
        inkscape
        qgis
        godot
        # gpxsee
        # blockbench
      ];
    };
}
