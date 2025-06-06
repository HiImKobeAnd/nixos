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
      pureref
      gpxsee
      zotero
      mokuro
      element-desktop
      cinny-desktop
      (chromium.override { enableWideVine = true; })
    ];
  };
}
