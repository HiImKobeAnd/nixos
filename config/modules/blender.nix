{ ... }:
{
  flake.nixosModules.blender =
    { pkgs, ... }:
    {
      nixpkgs.config.packageOverrides = pkgs: {
        blender = pkgs.blender.override { cudaSupport = true; };
      };
      environment.systemPackages = with pkgs; [
        blender
      ];
    };
}
