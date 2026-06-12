{ ... }: {
  plugins.harpoon = {
    enable = true;
    enableTelescope = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>a";
      action.__raw = "function() require('harpoon'):list():add() end";
      options.desc = "[A]dd to harpoon";
    }
    {
      mode = "n";
      key = "<C-v>";
      action.__raw = "function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end";
      options.desc = "[V]iew harpoon";
    }
  ];
}
