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
      youtube-music
      libreoffice-fresh
      obsidian
    ];
  };
}
