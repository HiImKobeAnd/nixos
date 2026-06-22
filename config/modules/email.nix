{ ... }:
{
  flake.nixosModules.email =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        birdtray
      ];
      programs.thunderbird.enable = true;
    };
}
