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
  ];
}
