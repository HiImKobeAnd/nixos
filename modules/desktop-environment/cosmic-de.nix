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
      cosmic-ext-applet-external-monitor-brightness
      ddcutil # Needed for external monitor brightness applet
    ];
    hardware.i2c.enable = true; # Needed for external monitor brightness applet
  };
}
