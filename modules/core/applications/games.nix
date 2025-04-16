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
      xivlauncher
      (lutris.override {
        extraPkgs = pkgs: [
          wine
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
      steam = {
        enable = true;
        gamescopeSession.enable = true;
        remotePlay.openFirewall = true;
      };
    };
    nix.settings.substituters = [ "https://ezkea.cachix.org" ];
    nix.settings.trusted-public-keys = [
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
    ];
  };
}
