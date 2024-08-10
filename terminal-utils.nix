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

    git
    git-credential-manager

    alejandra
    manix
    dconf2nix
    nil
    nh
  ];
}
