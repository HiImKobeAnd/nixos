{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    syncthing
  ];
  services.syncthing = {
    enable = true;
    overrideDevices = false;
    overrideFolders = false;
    dataDir = "/home/hiimkobeand";
    configDir = "/home/hiimkobeand/.config/syncthing";
  };
}
