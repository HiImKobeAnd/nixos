{ ... }:
{
  flake.nixosModules.nix-tools =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        nh
        any-nix-shell
        nixpkgs-review
        nix-init
        nil
        nixfmt
        devenv
      ];
      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
        enableFishIntegration = true;
      };
    };

}
