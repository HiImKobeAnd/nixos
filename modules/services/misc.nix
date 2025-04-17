{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.modules.services.misc.enable {
    environment.systemPackages = with pkgs; [
      spice
    ];
    services.flatpak.enable = true;
    services.spice-vdagentd.enable = true;
  };
}
