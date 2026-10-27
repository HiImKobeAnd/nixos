_: {
  flake.nixosModules.cosmic-de = {pkgs, ...}: {
    services = {
      displayManager.cosmic-greeter.enable = true;
      desktopManager.cosmic.enable = true;
      geoclue2.enable = true;
      geoclue2.enableDemoAgent = false;
      system76-scheduler.enable = true;
      ddccontrol.enable = true;
    };

    # Fix for 90 sec wait when shutting down

    boot.kernelParams = ["nvidia_drm.fbdev=1"];
    environment = {
      sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
      systemPackages = with pkgs; [
        cosmic-ext-applet-external-monitor-brightness
        cosmic-ext-applet-weather
        ddcutil # Needed for external monitor brightness applet
      ];
      cosmic.excludePackages = with pkgs; [
        cosmic-term # Misaligns cursor in neovim
      ];
    };

    # Needed for external monitor brightness applet
  };
}
