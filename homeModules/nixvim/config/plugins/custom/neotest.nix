{ pkgs, ... }:
{
  plugins.neotest = {
    enable = true;
    settings = {
      diagnostic.enabled = true;
      diagnostic.severity = "error";
      discovery.enabled = true;
      discovery.concurrent = 0;
      running.concurrent = true;
      state.enabled = true;
      status.enabled = true;
      status.signs = true;
      summary.enabled = true;
      summary.expandErrors = true;
      summary.follow = true;
      watch.enabled = true;
      stategies = "integrated";
    };
    adapters = {
      elixir.enable = true;
      rust.enable = true;
      plenary.enable = true;
    };
  };
}
