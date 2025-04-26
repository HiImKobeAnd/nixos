{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.modules.services.syncthing.enable {
    environment.systemPackages = with pkgs; [
      syncthing
    ];
    systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true"; # Don't create default ~/Sync folder
    services.syncthing = {
      enable = true;
      overrideDevices = false;
      overrideFolders = false;
      user = "hiimkobeand";
      openDefaultPorts = true;

      dataDir = "/home/hiimkobeand";
      configDir = "/home/hiimkobeand/.config/syncthing";
    };
  };
}
