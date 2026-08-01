{ ... }:
{
  flake.nixosModules.python =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        uv
      ];
      # For Python UV
      environment.localBinInPath = true;
    };
}
