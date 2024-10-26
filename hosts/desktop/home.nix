{pkgs, ...}: {
  imports = [
    ../../homeModules/nixvim.nix
    ../../homeModules/nixcord.nix
  ];
  home = {
    username = "hiimkobeand";
    homeDirectory = "/home/hiimkobeand";
    stateVersion = "24.05";
  };

  xdg.desktopEntries = {
    windows = {
      name = "windows 11";
      genericName = "Virtual machine";
      exec = "quickemu --vm /home/hiimkobeand/VM/quickemu/windows-11.conf --display spice";
      terminal = false;
      categories = ["Utility"];
    };
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "hiimkobeand";
      userEmail = "hiimkobeand@gmail.com";
      aliases = {
        st = "status";
        aa = "add -A";
        cc = "!koji";
        ll = "log --oneline --decorate --graph";
        last = "log -1 HEAD";
        unstage = "reset HEAD --";
      };
    };

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
        ${pkgs.any-nix-shell}any-nix-shell fish --info-right | source
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
      extraOptions = ["--icons=auto"];
    };

    gh.enable = true;

    zathura = {
      enable = true;
      options = {
        continuous-hist-save = "true";
        database = "sqlite";
      };
    };

    sioyek = {
      enable = true;
      config = {
        "shared_database_path" = "/home/hiimkobeand/sioyek";
      };
    };
  };
}
