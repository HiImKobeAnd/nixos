{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.modules.services.controllers.enable {
    hardware.uinput.enable = true;
    services = {
      udev = {
        packages = with pkgs; [
          game-devices-udev-rules
        ];
      };
    };
  };
}
