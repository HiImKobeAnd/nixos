{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.modules.services.paperless.enable {
    environment.systemPackages = with pkgs; [
      paperless-ngx
    ];
    services.paperless = {
      enable = true;
      port = 8240;
    };
  };
}
