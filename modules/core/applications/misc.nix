{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.modules.applications.misc.enable {
    programs.noisetorch.enable = true;
    programs.obs-studio = {
      enable = true;
      package = (
        pkgs.obs-studio.override {
          cudaSupport = true;
        }
      );
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-pipewire-audio-capture
        obs-backgroundremoval
      ];
    };
    environment.systemPackages = with pkgs; [
      anki
      noisetorch
      krita
      inkscape
      podman
      # gpxsee
      zotero
      blockbench
      # firefox
      # element-desktop
      godot
      easyeffects
      (chromium.override { enableWideVine = true; })
    ];
  };
}
