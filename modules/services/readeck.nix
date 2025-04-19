{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.modules.services.readeck.enable {
    environment.systemPackages = with pkgs; [
      readeck
    ];
    services.readeck = {
      enable = true;
      environmentFile = "${config.users.users.wsl.home}/.config/readeck/.env";
      settings = {
        server.port = 8160;
      };
    };
  };
}
