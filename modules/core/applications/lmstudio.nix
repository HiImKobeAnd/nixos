{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.modules.applications.lmstudio.enable {
    environment.systemPackages = with pkgs; [
      lmstudio
    ];
  };
}
