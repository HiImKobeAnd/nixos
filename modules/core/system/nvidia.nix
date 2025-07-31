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

    boot.kernelParams = [
      "NVreg_PreserveVideoMemoryAllocations=1"
    ];

    services.xserver.videoDrivers = [ "nvidia" ];

    powerManagement.enable = true;
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
