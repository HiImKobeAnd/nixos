{ ... }:
{
  flake.nixosModules.qt-tools =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        qtcreator
      ];
    };
}
