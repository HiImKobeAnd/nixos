_: {
  flake.nixosModules.cloudflared = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [cloudflared];
    services.cloudflared.enable = true;
  };
}
