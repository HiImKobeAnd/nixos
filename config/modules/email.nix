{ ... }:
{
  flake.nixosModules.email =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        evolution
        evolution-ews
      ];
      programs.thunderbird.enable = true;
    };
}
