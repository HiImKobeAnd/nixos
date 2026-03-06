{
  # Highlight todo, notes, etc in comments
  # https://nix-community.github.io/nixvim/plugins/todo-comments/index.html
  plugins.todo-comments = {
    enable = true;
    # TODO
    settings = {
      signs = true;
      sign_priority = 8;
      #     merge_keywords = true;
      #     keywords = {
      #       FIX = {
      #         alt = [
      #           "FIXME"
      #           "BUG"
      #           "FIXIT"
      #           "ISSUE"
      #         ];
      #         color = "error";
      #         icon = " ";
      #       };
      #       HACK = {
      #         color = "warning";
      #         icon = " ";
      #       };
      #       NOTE = {
      #         alt = [
      #           "INFO"
      #         ];
      #         color = "hint";
      #         icon = " ";
      #       };
      #       PERF = {
      #         alt = [
      #           "OPTIM"
      #           "PERFORMANCE"
      #           "OPTIMIZE"
      #         ];
      #         icon = " ";
      #       };
      #       TEST = {
      #         alt = [
      #           "TESTING"
      #           "PASSED"
      #           "FAILED"
      #         ];
      #         color = "test";
      #         icon = "⏲ ";
      #       };
      #       TODO = {
      #         color = "info";
      #         icon = "";
      #       };
      #       WARN = {
      #         alt = [
      #           "WARNING"
      #           "XXX"
      #         ];
      #         color = "warning";
      #         icon = " ";
      #       };
      #     };
      #     colors = {
      #       default = [
      #         "Identifier"
      #         "#7C3AED"
      #       ];
      #       error = [
      #         "DiagnosticError"
      #         "ErrorMsg"
      #         "#fb4934"
      #       ];
      #       hint = [
      #         "DiagnosticHint"
      #         "#8ec07c"
      #       ];
      #       info = [
      #         "DiagnosticInfo"
      #         "#83a598"
      #       ];
      #       test = [
      #         "Identifier"
      #         "#fe8019"
      #       ];
      #       warning = [
      #         "DiagnosticWarn"
      #         "WarningMsg"
      #         "#fabd2f"
      #       ];
      #     };
      #     gui_style.bg = "BOLD";
      #     gui_style.fg = "NONE";
      #     highlight = {
      #       after = "fg";
      #       comments_only = true;
      #       keyword = "wide";
      #       max_line_len = 400;
      #       multiline = true;
      #       multiline_context = 10;
      #       multiline_pattern = "^.";
      #       pattern = ".*<(KEYWORDS)\\s*:";
      #     };
      search = {
        #       args = [
        #         "--color=never"
        #         "--no-heading"
        #         "--with-filename"
        #         "--line-number"
        #         "--column"
        #       ];
        # command = "rg";
        #       pattern = "\\b(KEYWORDS):";
      };
    };
  };
}
