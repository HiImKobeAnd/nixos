{ ... }:
{
  flake.nixosModules.syncthing =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        syncthing
      ];
      systemd.services.syncthing.environment.STNODEFAULTFOLDER = "true"; # Disables creation of default ~/Sync folder
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
