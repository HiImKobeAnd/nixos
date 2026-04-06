_: {
  programs = {
    bash.enable = true;
    fish = {
      enable = true;
      shellAliases = {
        ls = "eza --group-directories-first";
        la = "eza --all";
        lt = "eza -R --level=1";
        ltt = "eza -R --level=2";
        lttt = "eza -R --level=3";
      };
      interactiveShellInit = ''
        set -U fish_greeting
        set fish_prompt_pwd_dir_length 0
      '';
    };

    zoxide = {
      enable = true;
      options = [
        "--cmd cd"
      ];
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    eza = {
      enable = true;
      enableFishIntegration = true;
      extraOptions = [ "--icons=auto" ];
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
