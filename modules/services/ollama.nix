{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.modules.services.ollama.enable {
    environment.systemPackages = with pkgs; [
      ollama
    ];
    services.ollama = {
      enable = true;
      acceleration = "cuda";
    };
    services.open-webui.enable = true;
  };
}
