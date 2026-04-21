{ pkgs, ... }:
{
  plugins.overseer = {
    enable = true;
    auto_detect_success_color = true;
    dap = true;
    strategy = "terminal";
    task_list = {
      bindings = {
        "<C-e>" = "Edit";
        "<C-f>" = "OpenFloat";
        "<C-h>" = "DecreaseDetail";
        "<C-j>" = "ScrollOutputDown";
        "<C-k>" = "ScrollOutputUp";
        "<C-l>" = "IncreaseDetail";
        "<C-q>" = "OpenQuickFix";
        "<C-s>" = "OpenSplit";
        "<C-v>" = "OpenVsplit";
        "<CR>" = "RunAction";
        "?" = "ShowHelp";
        H = "DecreaseAllDetail";
        L = "IncreaseAllDetail";
        "[" = "DecreaseWidth";
        "]" = "IncreaseWidth";
        "g?" = "ShowHelp";
        o = "Open";
        p = "TogglePreview";
        q = "Close";
        "{" = "PrevTask";
        "}" = "NextTask";
      };
      default_detail = 1;
      direction = "bottom";
      height = null;
      max_height = [
        20
        0.1
      ];
      max_width = [
        100
        0.2
      ];
      min_height = 8;
      min_width = [
        40
        0.1
      ];
      separator = "────────────────────────────────────────";
      width = null;
    };
    templates = [ "builtin" ];
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>rr";
      action.__raw = "function() require('overseer').list_tasks() end";
      options.desc = "[R]un task ove[r]view";
    }
    {
      mode = "n";
      key = "<leader>rt";
      action.__raw = "function() require('overseer').toggle({direction = {'right'}}) end";
      options.desc = "[R]un [t]ask ove[r]view";
    }
    {
      mode = "n";
      key = "<leader>rb";
      action.__raw = "function() require('overseer').run_task({tags = {overseer.TAG.BUILD}}) end";
      options.desc = "[R]un [b]uild";
    }
  ];
}
