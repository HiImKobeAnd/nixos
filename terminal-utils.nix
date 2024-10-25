{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    curl
    wget

    fish

    pandoc

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

  programs.fish.enable = true;
  programs.fish.interactiveShellInit = ''
      set -U fish_greeting
      set fish_prompt_pwd_dir_length 0
    ${pkgs.any-nix-shell}/bin/any-nix-shell fish --info-left | source
  '';
}
