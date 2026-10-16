{ ... }:
{
  flake.nixosModules.keyclock =
    { pkgs, ... }:
    {
      services.keyclock = {
        enable = true;
        settings = {

        };
      };
    };
}
