{ ... }: {
  plugins.harpoon = {
    enable = true;
    enableTelescope = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>a";
      action.__raw = "function() harpoon:list():add() end";
      options.desc = "[A]dd to harpoon";
    }
    {
      mode = "n";
      key = "<C-v>";
      action.__raw = "function() harpoon.ui:toggle_quick_menu(harpoon:list()) end";
      options.desc = "[V]iew harpoon";
    }
  ];
}
