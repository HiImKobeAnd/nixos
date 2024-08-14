{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    syncthing
  ];
  services.syncthing = {
    enable = true;
    overrideDevices = true;
    overrideFolders = true;
    user = "hiimkobeand";

    dataDir = "/home/hiimkobeand";
    #configDir = "/home/hiimkobeand/.config/syncthing";

    devices = {
      "SM-S901B" = {id = "4HONYPG-EMW667X-XFYMDA5-MZRHJI2-AZFGS7N-UTYY2NX-J3TIFOJ-MGEUNA7";};
    };

    folders = {
      "Documents" = {
        path = "/home/hiimkobeand/Documents";
        devices = ["SM-S901B"];
      };
      "Pictures" = {
        path = "/home/hiimkobeand/Pictures";
        devices = ["SM-S901B"];
      };
    };
  };
}
