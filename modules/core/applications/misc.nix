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
      enable = false;
      package = (
        pkgs.obs-studio.override {
          cudaSupport = true;
        }
      );
      plugins = with pkgs.obs-studio-plugins; [
        obs-pipewire-audio-capture
      ];
    };
    environment.systemPackages = with pkgs; [
      anki
      noisetorch
      krita
      inkscape
      # gpxsee
      zotero
      # firefox
      # element-desktop
      (chromium.override { enableWideVine = true; })
    ];
  };
}
