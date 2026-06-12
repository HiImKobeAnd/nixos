{ ... }: {
  plugins.harpoon = {
    enable = true;
    enableTelescope = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>aa";
      action.__raw = "function() require('harpoon'):list():add() end";
      options.desc = "[A]dd to harpoon";
    }
    {
      mode = "n";
      key = "<leader>av";
      action.__raw = "function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end";
      options.desc = "[V]iew harpoon";
    }
    {
      mode = "n";
      key = "<leader>as";
      action.__raw = "function() require('harpoon'):list():select(1) end";
      options.desc = "Go to harpoon 1";
    }
    {
      mode = "n";
      key = "<leader>ad";
      action.__raw = "function() require('harpoon'):list():select(2) end";
      options.desc = "Go to harpoon 2";
    }
    {
      mode = "n";
      key = "<leader>af";
      action.__raw = "function() require('harpoon'):list():select(3) end";
      options.desc = "Go to harpoon 3";
    }
    {
      mode = "n";
      key = "<leader>ag";
      action.__raw = "function() require('harpoon'):list():select(4) end";
      options.desc = "Go to harpoon 4";
    }
  ];
}
