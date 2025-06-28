{ lib, ... }:
{
  options.modules.sound.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };
  options.modules.fonts.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };
  options.modules.nvidia.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };
}
