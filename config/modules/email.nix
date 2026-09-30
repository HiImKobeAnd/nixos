{ ... }:
{
  flake.nixosModules.email =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        bluemail
        evolution
      ];
      programs.thunderbird.enable = true;
    };
}
