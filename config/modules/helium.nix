{ inputs, ... }:
{
  flake.nixosModules.helium =
    { pkgs, system, ... }:
    {
      environment.systemPackages = [
        # inputs.helium-nix.packages."x86_64-linux".helium
      ];
      nix.settings = {
        substituters = [ "https://helium-nix.cachix.org" ];
        trusted-public-keys = [ "helium-nix.cachix.org-1:a8YPjt9O4GPyX0u3gjg/aWpb14teU9aRiSG/MOaSFgw=" ];
      };
    };
}
