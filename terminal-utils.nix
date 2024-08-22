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

    alejandra
    manix
    dconf2nix
    nil
    nh
    comma
  ];
}
