{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    curl
    wget

    fish

    pandoc
    texliveFull

    fzf
    eza
    bat
    bat-extras.batman
    bat-extras.batdiff
    btop
    dua
    zoxide
    ripgrep
    tldr

    quickemu

    git
    lazygit
    gh
    koji

    unzip
    zip

    lua-language-server

    alejandra
    manix
    dconf2nix
    nil
    nh

    any-nix-shell
  ];
  programs = {
    bash = {
      interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };
  };
}
