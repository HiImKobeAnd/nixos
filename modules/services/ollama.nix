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
      librechat
    ];
    services.ollama = {
      enable = true;
      acceleration = "cuda";
    };
  };
}
