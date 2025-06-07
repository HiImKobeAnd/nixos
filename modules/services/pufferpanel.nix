{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.modules.services.pufferpanel.enable {
    environment.systemPackages = with pkgs; [
      pufferpanel
    ];
    services.pufferpanel = {
      enable = true;
      environment = {
        PUFFER_WEB_HOST = ":8080";
      };
    };
  };
}
