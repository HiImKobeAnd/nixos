{
  pkgs,
  lib,
  ...
}:
{
  vim = {
    extraPackages = [ pkgs.catimg ];
    viAlias = true;
    vimAlias = false;

    options = {
      mouse = "a";
      shiftwidth = 2;
      tabstop = 2;
      showmode = false;
    };
    searchCase = "smart";
    undoFile.enable = true;

    treesitter.enable = true;
    lazy.enable = false;
    autopairs.nvim-autopairs.enable = true;

    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
    };

    extraPlugins = {
      auto-dark-mode-nvim = {
        package = pkgs.vimPlugins.auto-dark-mode-nvim;
        setup = "require('auto-dark-mode').setup {}";
      };
    };

    binds.whichKey = {
      enable = true;
    };
    statusline.lualine.enable = true;

    snippets.luasnip.enable = true;
    autocomplete.blink-cmp = {
      enable = true;
      mappings = {
        confirm = "<C-y>";
        close = "<C-e>";
        next = "<Tab>";
        previous = "<S-Tab>";
      };
    };

    session.nvim-session-manager = {
      enable = true;
      setupOpts.autoload_mode = "CurrentDir";
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      inlayHints.enable = true;
      lightbulb.enable = true;
      lspconfig.enable = true;
      servers = {
        luau-lsp = {
          cmd = lib.mkDefault [
            (lib.getExe pkgs.luau-lsp)
            "lsp"
          ];
          filetypes = [ "luau" ];
          root_markers = [
            ".git"
            ".luaurc"
          ];
          settings.luau-lsp = {
            types.definitionFiles = [ "noctalia.d.luau" ];
          };
        };
      };
    };

    visuals = {
      nvim-web-devicons.enable = true;
      fidget-nvim.enable = true;
    };

    notes.todo-comments.enable = true;

    ui = {
      borders.enable = true;
      ui2.enable = true;
    };

    vendoredKeymaps.enable = false;

    clipboard = {
      enable = true;
      providers.wl-copy.enable = true;
      registers = "unnamedplus";
    };

    diagnostics = {
      enable = true;
      nvim-lint.enable = true;
    };

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    utility = {
      images.image-nvim = {
        enable = true;
        setupOpts.backend = "kitty";
      };
      motion = {
        leap = {
          enable = true;
          mappings = {
            leapBackwardTill = "<leader>sX";
            leapBackwardTo = "<leader>sS";
            leapForwardTill = "<leader>sx";
            leapForwardTo = "<leader>ss";

          };
        };
      };
    };

    terminal.toggleterm = {
      enable = true;
      mappings.open = "<c-t>";
      setupOpts.direction = "float";
    };

    languages = {
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableTreesitter = true;

      nix = {
        enable = true;
        format.type = [ "nixfmt" ];
        lsp.servers = [ "nixd" ];
      };
      rust.enable = true;
      fish.enable = true;
      elixir.enable = true;
      docker.enable = true;
      bash.enable = true;
      go.enable = true;
      make.enable = true;
      env.enable = true;
      html.enable = true;
      json.enable = true;
      just.enable = true;
      lua.enable = true;
      markdown.enable = true;
      python.enable = true;
      sql.enable = true;
      css.enable = true;
      toml.enable = true;
      typescript.enable = true;
    };

    binds.whichKey.register = lib.mkForce {
      "<leader>s" = "[S]earch";
    };
    telescope = {
      enable = true;
      setupOpts = {
        defaults = {
          color_devicons = true;
          preview.mime_hook = {
            __raw = ''
              function(filepath, bufnr, opts)
                local is_image = function(filepath)
                  local image_extensions = {'png', 'jpg', 'jpeg', 'webp'}
                  local split_path = vim.split(filepath:lower(), '.', {plain=true})
                  local extension = split_path[#split_path]
                  return vim.tbl_contains(image_extensions, extension)
                end

                if is_image(filepath) then
                  local term = vim.api.nvim_open_term(bufnr, {})
                  local function send_output(_, data, _)
                    for _, d in ipairs(data) do
                      vim.api.nvim_chan_send(term, d .. "\r\n")
                    end
                  end
                  vim.fn.jobstart(
                    { 'catimg', filepath },
                    { on_stdout = send_output, stdout_buffered = true, pty = true }
                  )
                else
                  require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
                end
              end
            '';
          };
        };
        pickers = {
          find_files.find_command = [
            "rg"
            "--files"
            "--hidden"
            "--glob"
            "!**/.git/*"
          ];
        };
      };
      mappings = {
        findFiles = "<leader>f";
        diagnostics = "<leader>sd";
        liveGrep = "<leader>sg";
        helpTags = "<leader>sh";
        open = "<leader>so";
      };
    };
    comments.comment-nvim = {
      enable = true;
      mappings.toggleSelectedLine = "<leader>c";
      mappings.toggleCurrentLine = "<leader>c";
    };
    keymaps = [
      {
        key = "<leader>q";
        mode = "n";
        silent = true;
        action = ":Telescope quickfix<CR>";
      }
      {
        key = "grd";
        mode = "n";
        action = ":Telescope lsp_definitions<CR>";
      }
      {
        key = "grr";
        mode = "n";
        action = ":Telescope lsp_references<CR>";
      }
      {
        key = "grs";
        mode = "n";
        action = ":Telescope lsp_document_symbols<CR>";
      }
      {
        key = "<Esc>";
        mode = "n";
        action = ":nohlsearch<CR>";
      }
      {
        key = "<leader>d";
        mode = "n";
        action = ":lua vim.diagnostic.open_float()<CR>";
      }
    ];
  };
}
