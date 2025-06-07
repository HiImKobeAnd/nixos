{
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.modules.services.docker.enable {
    virtualisation.docker.enable = true;
    virtualisation.docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
