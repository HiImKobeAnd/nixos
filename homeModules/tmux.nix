{...}: {
  programs = {
    tmux = {
      enable = true;
      clock24 = true;
    };
    tmuxPlugins = {
      tmux-fzf = {
        enable = true;
      };
    };
  };
}
