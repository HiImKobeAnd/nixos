{
  flake.nixosModules.tailscale = _: {
    services.tailscale = {
      enable = true;
    };
  };
}
