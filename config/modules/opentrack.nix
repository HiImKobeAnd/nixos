{ ... }:
{
  flake.nixosModules.opentrack =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        opentrack
        aitrack
      ];
    };
}
