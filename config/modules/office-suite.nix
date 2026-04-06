{ ... }:
{
  flake.nixosModules.office-suite =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        libreoffice-fresh
      ];
    };
}
