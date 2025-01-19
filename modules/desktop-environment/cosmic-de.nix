{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    cosmic-de.enable = lib.mkEnableOption "enables cosmic-de";
  };
  config = lib.mkIf config.cosmic-de.enable {
    services.displayManager.cosmic-greeter.enable = true;
    services.desktopManager.cosmic.enable = true;
    boot.kernelParams = ["nvidia_drm.fbdev=1"];
    environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
    environment.systemPackages = with pkgs; [
    ];
  };
}
