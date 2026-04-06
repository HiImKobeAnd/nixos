{ ... }:
{
  flake.nixosModules.email =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        thunderbird
      ];
    };
}
