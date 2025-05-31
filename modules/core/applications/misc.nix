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
      pureref
      gpxsee
      zotero
      (chromium.override { enableWideVine = true; })
    ];
  };
}
