{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.modules.services.rssfeed.enable {
    environment.systemPackages = with pkgs; [
      miniflux
    ];
    services.miniflux = {
      enable = true;
      config = {
        LISTEN_ADDR = "localhost:8240";
        CREATE_ADMIN = 0;      };
    };
  };
}
