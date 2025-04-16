{ lib, ... }:
{
  options.modules.sound = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Weather to enable sound or not.";
  };
}
