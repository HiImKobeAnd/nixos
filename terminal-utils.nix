{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    curl
    wget

    fish

    dolphin
    nemo

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
    gh
    koji

    lua-language-server

    alejandra
    manix
    dconf2nix
    nil
    nh
  ];
}
