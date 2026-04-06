{ ... }:
{
  flake.nixosModules.chromium =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        (chromium.override { enableWideVine = true; })
      ];
    };
}
