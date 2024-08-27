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
    tldr

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
