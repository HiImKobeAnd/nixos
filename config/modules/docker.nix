{ ... }:
{
  flake.nixosModules.docker =
    {
      pkgs,
      ...
    }:
    {
      virtualisation.docker.enable = true;
      virtualisation.docker.rootless = {
        enable = true;
        setSocketVariable = true;
      };
      hardware.nvidia-container-toolkit.enable = true; # For using NVIDIA GPU in docker containers
      virtualisation.docker.daemon.settings.features.cdi = true; # For using NVIDIA GPU in docker containers
    };
}
