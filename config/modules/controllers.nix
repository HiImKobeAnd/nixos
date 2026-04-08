{ ... }:
{
  flake.nixosModules.controllers =
    { pkgs, ... }:
    {
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
