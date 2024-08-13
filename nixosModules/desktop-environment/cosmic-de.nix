{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    cosmic-de.enable = lib.mkEnableOption "enables cosmic-de";
  };
  config = lib.mkIf config.cosmic-de.enable {
    services.displayManager.cosmic-greeter.enable = true;
    services.desktopManager.cosmic.enable = true;
  };
}
