{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.modules.applications.misc.enable {
    programs.noisetorch.enable = true;
    environment.systemPackages = with pkgs; [
      anki
      noisetorch
      krita
      inkscape
      # gpxsee
      zotero
      firefox
      calibre
      rnnoise-plugin
      (chromium.override { enableWideVine = true; })
    ];
  };
}
