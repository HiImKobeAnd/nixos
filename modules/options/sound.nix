{ lib, ... }:
{
  options.modules.sound.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Weather to enable sound or not.";
  };
}
