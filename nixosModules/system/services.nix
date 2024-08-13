{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    syncthing
  ];
  services.syncthing = {
    enable = true;
    overrideDevices = false;
    overrideFolders = false;
  };
}
