{ ... }:
{
  flake.nixosModules.winboat =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        winboat
      ];
    };
}
