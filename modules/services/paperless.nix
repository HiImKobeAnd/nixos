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
      settings = {
        PAPERLESS_OCR_LANGUAGE = "dan+eng";
        PAPERLESS_OCR_USER_ARGS = {
          optimize = 1;
          pdfa_image_compression = "lossless";
        };
      };
    };
  };
}
