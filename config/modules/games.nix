{ inputs, ... }:
{
  flake.nixosModules.other-games =
    { pkgs, ... }:
    {
      imports = [
        inputs.aagl.nixosModules.default
      ];
      environment.systemPackages = with pkgs; [
        osu-lazer-bin
        xivlauncher
        # (retroarch.withCores (
        #   cores: with cores; [
        #     melonds
        #   ]
        # ))
        # (lutris.override {
        #   extraPkgs = pkgs: [
        #     wine
        #   ];
        # })
        # (heroic.override {
        #   extraPkgs = pkgs: [
        #     pkgs.gamescope
        #   ];
        # })
      ];
      programs = {
        honkers-railway-launcher.enable = true;
        anime-games-launcher.enable = true;
      };
      nix.settings.substituters = [ "https://ezkea.cachix.org" ];
      nix.settings.trusted-public-keys = [
        "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      ];
    };
}
