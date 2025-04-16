{
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.modules.nvidia.enable {
    hardware.graphics = {
      enable = true;
    };

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;

      powerManagement.enable = true;
      powerManagement.finegrained = false;

      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
