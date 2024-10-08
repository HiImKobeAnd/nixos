{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    syncthing
    spice
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

  services.spice-vdagentd.enable = true;

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            "pageup" = "playpause";
            "pagedown" = "nextsong";
            "home" = "f23";
            "end" = "f24";
            #rightalt = "layer(rightalt)";
          };
          rightalt = {
            "pageup" = "pageup";
            "pagedown" = "pagedown";
            "home" = "home";
            "end" = "end";
          };
        };
      };
    };
  };
}
