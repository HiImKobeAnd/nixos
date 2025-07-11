{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf config.modules.services.cloudflared.enable {
    environment.systemPackages = with pkgs; [
      cloudflared
      screen
    ];
    services.cloudflared = {
      enable = true;
      # tunnels = {
      #   "b8fbe9aa-450b-4949-94b2-35bce8be1ca8" = {
      #     credentialsFile =
      #     default = "http_status:404";
      #   };
      # };
    };
  };
}
