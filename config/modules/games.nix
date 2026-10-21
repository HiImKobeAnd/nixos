{ inputs, ... }:
{
  flake.nixosModules.games =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        osu-lazer-bin
        # (retroarch.withCores (
        #   cores: with cores; [
        #     melonds
        #   ]
        # ))
        # (lutris.override {
        # extraPkgs = pkgs: [
        # wine
        # ];
        # })
        # (heroic.override {
        # extraPkgs = pkgs: [
        # pkgs.gamescope
        # ];
        # })
      ];
    };
}
