{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    syncthing
  ];
  services.syncthing = {
    enable = true;
    overrideDevices = false;
    overrideFolders = false;
    user = "hiimkobeand";
    openDefaultPorts = true;

    dataDir = "/home/hiimkobeand";
    configDir = "/home/hiimkobeand/.config/syncthing";
  };
  services.flatpak.enable = true;

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            "pageup" = "playpause";
            "pagedown" = "nextsong";
          };
          ctrl = {
            "pageup" = "pageup";
            "pagedown" = "pagedown";
          };
        };
      };
    };
  };
}
