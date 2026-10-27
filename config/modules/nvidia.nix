_: {
  flake.nixosModules.nvidia = {config, ...}: {
    hardware = {
      graphics.enable = true;
      graphics.enable32Bit = true;
      nvidia = {
        modesetting.enable = true;
        open = false;
        nvidiaSettings = true;

        powerManagement.enable = true;
        powerManagement.finegrained = false;

        package = config.boot.kernelPackages.nvidiaPackages.stable;
      };
    };
    services.xserver.videoDrivers = ["nvidia"];
    powerManagement.enable = true;
    boot.kernelParams = [
      "NVreg_UseKernelSuspendNotifiers=1"
    ];
  };
}
