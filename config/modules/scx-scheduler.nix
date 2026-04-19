{ ... }:
{
  flake.nixosModules.scx-scheduler =
    { pkgs, ... }:
    {
      services.scx = {
        enable = true;
        scheduler = "scx_rustland";
      };
    };
}
