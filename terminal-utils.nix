{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    curl
    wget

    fish

    fzf
    eza
    bat
    btop
    dua
    zoxide
    ripgrep

    quickemu

    git
    lazygit
    gh
    koji

    unzip
    zip

    lua-language-server

    alejandra
    nixfmt-rfc-style
    manix
    dconf2nix
    nil
    nh

    any-nix-shell
  ];
  programs = {
    nix-ld.enable = true;
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
