{ lib, ... }:
{
  options.modules.applications = {
    essentials = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    games = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    librewolf = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    misc = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    waydroid = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    quickemu = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
