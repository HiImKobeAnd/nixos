{...}: {
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
        c2odt = "libreoffice --headless --convert-to odt *.docx";
        opgaver = "~/Documents/Scripts/convert_opgaver.sh";
        o = "xdg-open";

        #Since I can't find an option to change the directory where my data is stored, I need to use the following alias:
        zathura = "zathura --fork -d ~/Documents/Books/zathura";
      };
      interactiveShellInit = ''
        set -U fish_greeting
        set fish_prompt_pwd_dir_length 0
      '';
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
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
      enableBashIntegration = true;
      extraOptions = ["--icons=auto"];
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    starship.enable = true;
  };
}
