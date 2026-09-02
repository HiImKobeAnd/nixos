{ inputs, ... }:
{
  flake.nixosModules.music =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        # pear-desktop
        inputs.kopuz.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];

      nix.settings = {
        substituters = [ "https://kopuz.cachix.org" ];
        trusted-public-keys = [ "kopuz.cachix.org-1:J2X3AnAYhKTJW5S3aCLoA1ckonQXVNZMQvhZA0YAufw=" ];
      };
    };
}
