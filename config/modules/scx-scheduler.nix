_: {
  flake.nixosModules.scx-scheduler = _: {
    services.scx = {
      enable = true;
      scheduler = "scx_lavd";
    };
  };
}
