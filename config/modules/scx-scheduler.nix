_: {
  flake.nixosModules.scx-scheduler = _: {
    services.scx-loader = {
      enable = true;
      config.default_sched = "scx_lavd";
    };
  };
}
