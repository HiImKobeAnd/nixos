{
  # Highlight todo, notes, etc in comments
  # https://nix-community.github.io/nixvim/plugins/todo-comments/index.html
  plugins.todo-comments = {
    enable = true;
    settings = {
      signs = true;
      colors = {
        default = [
          "Identifier"
          "#D3869B"
        ];
        error = [
          "DiagnosticError"
          "ErrorMsg"
          "#FB4934"
        ];
        hint = [
          "DiagnosticHint"
          "#8EC07C"
        ];
        info = [
          "DiagnosticInfo"
          "#83A598"
        ];
        test = [
          "Identifier"
          "#D3869B"
        ];
        warning = [
          "DiagnosticWarn"
          "WarningMsg"
          "#FABD2F"
        ];
      };
      keywords = {
        FIX = {
          alt = [
            "FIXME"
            "BUG"
            "FIXIT"
            "ISSUE"
          ];
          color = "error";
          icon = " ";
        };
        HACK = {
          color = "warning";
          icon = " ";
        };
        NOTE = {
          alt = [
            "INFO"
          ];
          color = "hint";
          icon = " ";
        };
        PERF = {
          alt = [
            "OPTIM"
            "PERFORMANCE"
            "OPTIMIZE"
          ];
          icon = " ";
        };
        TEST = {
          alt = [
            "TESTING"
            "PASSED"
            "FAILED"
          ];
          color = "test";
          icon = "⏲ ";
        };
        TODO = {
          color = "info";
          icon = " ";
        };
        WARN = {
          alt = [
            "WARNING"
            "XXX"
          ];
          color = "warning";
          icon = " ";
        };
      };

    };
  };
}
