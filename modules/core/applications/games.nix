{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.modules.applications.games.enable {
    environment.systemPackages = with pkgs; [
      steam
      gamemode
      protonup-rs
      # xivlauncher
      (retroarch.withCores (
        cores: with cores; [
          melonds
        ]
      ))
      # (lutris.override {
      #   extraPkgs = pkgs: [
      #     wine
      #   ];
      # })
      (heroic.override {
        extraPkgs = pkgs: [
          pkgs.gamescope
        ];
      })
      (prismlauncher.override {
        additionalPrograms = [ ffmpeg ];
        jdks = [
          temurin-bin
          temurin-jre-bin-17
        ];
      })
    ];
    programs = {
      steam.enable = true;
      steam.gamescopeSession.enable = true;
      steam.remotePlay.openFirewall = true;
      gamemode.enable = true;
      #honkers-railway-launcher.enable = true;
    };
    # nix.settings.substituters = [ "https://ezkea.cachix.org" ];
    # nix.settings.trusted-public-keys = [
    #   "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
    # ];
  };
}
