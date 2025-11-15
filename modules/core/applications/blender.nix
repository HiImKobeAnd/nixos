{
  lib,
  pkgs,
  config,
  ...
}:
{
  config = lib.mkIf config.modules.applications.blender.enable {
    environment.systemPackages = with pkgs; [
      (blender.override {
        cudaSupport = true;
      })
    ];
  };
}
