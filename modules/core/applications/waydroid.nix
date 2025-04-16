{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.modules.applications.waydroid.enable {
    virtualisation.waydroid.enable = true;
    environment.systemPackages = with pkgs; [
      waydroid
    ];
  };
}
