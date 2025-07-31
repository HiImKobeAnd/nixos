{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf (config.modules.desktop == "cosmic") {
    # nix.settings.substituters = [ "https://cosmic.cachix.org" ];
    # nix.settings.trusted-public-keys = [
    #   "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
    # ];
    services.displayManager.cosmic-greeter.enable = true;
    services.desktopManager.cosmic.enable = true;
    boot.kernelParams = [ "nvidia_drm.fbdev=1" ];
    environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
    environment.systemPackages = with pkgs; [
      # cosmic-ext-applet-external-monitor-brightness
      ddcutil # Needed for external monitor brightness applet
    ];
    hardware.i2c.enable = true; # Needed for external monitor brightness applet
  };
}
