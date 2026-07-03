{ ... }:
{
  flake.nixosModules.zed =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        zed-editor-fhs
      ];
    };
}
