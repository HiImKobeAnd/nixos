{ pkgs, ... }:
{
  plugins.neotest = {
    enable = true;
    settings = {
      diagnostic.enabled = true;
      diagnostic.severity = "error";
      discovery.enabled = true;
      running.concurrent = true;
      state.enabled = true;
      status.enabled = true;
      status.signs = true;
      summary.enabled = true;
      summary.expandErrors = true;
      summary.follow = true;
      watch.enabled = true;
    };
    adapters = {
      elixir.enable = true;
      rust.enable = true;
    };
  };
}
