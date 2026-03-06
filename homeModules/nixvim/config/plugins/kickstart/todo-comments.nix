{
  # Highlight todo, notes, etc in comments
  # https://nix-community.github.io/nixvim/plugins/todo-comments/index.html
  plugins.todo-comments = {
    enable = true;
    settings = {
      signs = true;
      sign_priority = 8;
      keywords = {
        FIX = {
          icon = " ";
          color = "error";
          alt = [
            "FIXME"
            "BUG"
            "FIXIT"
            "ISSUE"
          ];
        };
        TODO = {
          icon = " ";
          color = "info";
        };
        HACK = {
          icon = " ";
          color = "warning";
        };
        WARN = {
          icon = " ";
          color = "warning";
          alt = [
            "WARNING"
            "XXX"
          ];
        };
        PERF = {
          icon = " ";
          alt = [
            "OPTIM"
            "PERFORMANCE"
            "OPTIMIZE"
          ];
        };
        NOTE = {
          icon = " ";
          color = "hint";
          alt = [ "INFO" ];
        };
        TEST = {
          icon = "⏲ ";
          color = "test";
          alt = [
            "TESTING"
            "PASSED"
            "FAILED"
          ];
        };
      };
      colors = {
        default = [
          "Identifier"
          "#7C3AED"
        ];
        error = [
          "DiagnosticError"
          "ErrorMsg"
          "#fb4934"
        ];
        hint = [
          "DiagnosticHint"
          "#8ec07c"
        ];
        info = [
          "DiagnosticInfo"
          "#83a598"
        ];
        test = [
          "Identifier"
          "#fe8019"
        ];
        warning = [
          "DiagnosticWarn"
          "WarningMsg"
          "#fabd2f"
        ];
      };
      gui_style.bg = "BOLD";
      gui_style.fg = "NONE";
      highlight = {
        after = "fg";
        comments_only = true;
        keyword = "wide";
        max_line_len = 400;
        multiline = true;
        multiline_context = 10;
        multiline_pattern = "^.";
        pattern = ".*<(KEYWORDS)\\s*:";
      };
      search = {
        args = [
          "--color=never"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
        ];
        command = "rg";
        pattern = "\\b(KEYWORDS):";
      };
    };
  };
}
