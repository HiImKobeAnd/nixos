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
  keymaps = [
    # Toggles
    {
      mode = "n";
      key = "<leader>tt";
      action.__raw = ''
        function()
          require('neotest').summary.toggle()
        end
      '';
      options = {
        desc = "[T]oggle [t]est summary";
      };
    }
    {
      mode = "n";
      key = "<leader>r";
      action.__raw = ''
        function()
        require('neotest').run.run()
        end
      '';
      options = {
        desc = "[R]un tests";
      };
    }
  ];
}
