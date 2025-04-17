{
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.modules.services.docker.enable {
    virtualisation.docker.enable = true;
    users.users.hiimkobeand.extraGroups = [ "docker" ];
    virtualisation.docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
