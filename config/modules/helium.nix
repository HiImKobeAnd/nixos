{ inputs, ... }:
{
  flake.nixosModules.helium =
    { pkgs, system, ... }:
    {
      imports = [ inputs.helium-nix.nixosModules.helium ];
      programs.helium = {
        enable = false;
        package = pkgs.helium.override {
          enableWideVine = true;
        };

        extraPolicies = {
          PasswordmanagerEnabled = false;
        };
      };
      nix.settings = {
        substituters = [ "https://helium-nix.cachix.org" ];
        trusted-public-keys = [ "helium-nix.cachix.org-1:a8YPjt9O4GPyX0u3gjg/aWpb14teU9aRiSG/MOaSFgw=" ];
      };
    };
}
