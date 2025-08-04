{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf (config.modules.desktop == "cosmic") {
    services.displayManager.cosmic-greeter.enable = true;
    services.desktopManager.cosmic.enable = true;
    # Fix for 90 sec wait when shutting down
    services.geoclue2.enable = true;
    services.geoclue2.enableDemoAgent = false;

    boot.kernelParams = [ "nvidia_drm.fbdev=1" ];
    environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
    environment.systemPackages = with pkgs; [
      # cosmic-ext-applet-external-monitor-brightness
      # ddcutil # Needed for external monitor brightness applet
    ];
    # hardware.i2c.enable = true; # Needed for external monitor brightness applet
  };
}
