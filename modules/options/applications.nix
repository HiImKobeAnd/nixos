{ lib, ... }:
{
  options.modules.applications = {
    essentials.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    games.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    librewolf.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    misc.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    waydroid.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    quickemu.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    ai-frontend.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
