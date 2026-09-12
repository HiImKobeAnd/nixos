{ inputs, ... }:
{
  flake.nixosModules.comma =
    { pkgs, ... }:
    {
      imports = [
        inputs.nix-index-database.nixosModules.default
      ];
      programs.nix-index-database.comma.enable = true;
      programs.nix-index.package = inputs.nix-index-database.packages.${pkgs.stdenv.hostPlatform.system}.nix-index-with-small-db;
    };
}
