{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    socials.enable = lib.mkEnableOption "Enables socials";
  };
  config = lib.mkIf config.socials.enable {
    environment.systemPackages = with pkgs; [
      #element-desktop
      webcord
    ];
  };
}
