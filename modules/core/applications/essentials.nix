{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.modules.applications.essentials.enable {
    programs.kdeconnect.enable = true;
    environment.systemPackages = with pkgs; [
      thunderbird
      pear-desktop
      libreoffice-fresh
      obsidian
    ];
  };
}
