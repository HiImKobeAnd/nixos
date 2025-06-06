{ lib, ... }:
{
  options.modules.services = {
    misc.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    pufferpanel.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    matrix.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    ssh.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    keyd.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    ollama.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    docker.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    controllers.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    syncthing.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    readeck.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    paperless.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    cloudflared.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };
}
