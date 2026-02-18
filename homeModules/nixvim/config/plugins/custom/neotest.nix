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
      default_strategy = "integrated";
    };
    adapters = {
      elixir.enable = true;
      rust.enable = true;
      plenary.enable = true;
    };
  };
  keymaps = [
    # Toggles
    {
      mode = "n";
      key = "<leader>tt";
      action.__raw = "function() require('neotest').summary.toggle() end";
      options.desc = "[T]oggle [t]est summary";
    }
    {
      mode = "n";
      key = "<leader>tw";
      action.__raw = "function() require('neotest').watch.toggle() end";
      options.desc = "[T]oggle [w]atch mode";
    }
    # Test running
    # {
    #   mode = "n";
    #   key = "<leader>rn";
    #   action.__raw = "function() require('neotest').run.run() end";
    #   options.desc = "[R]un [n]earest test";
    # }
    {
      mode = "n";
      key = "<leader>rr";
      action.__raw = "function() require('neotest').run.run(vim.fn.getcwd()) end";
      options.desc = "[R]un test project";
    }
  ];
}
