{ ... }:
{
  flake.nixosModules.email =
    { pkgs, ... }:
    {
      programs.thunderbird.enable = true;
    };
}
