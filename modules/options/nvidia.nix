{ lib, ... }:
{
  options.modules.nvidia.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Weather to enable nvidia drivers or not.";
  };
}
