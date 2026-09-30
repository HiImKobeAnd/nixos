{ ... }:
{
  flake.nixosModules.email =
    { pkgs, ... }:
    {
      programs.evolution = {
        enable = true;
        plugins = [ pkgs.evolution-ews ];
      };
      programs.thunderbird.enable = true;
    };
}
