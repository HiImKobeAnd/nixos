{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    spice
  ];
  services.flatpak.enable = true;
  services.spice-vdagentd.enable = true;
}
