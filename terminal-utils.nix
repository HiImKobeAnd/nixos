{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nil
    curl
    git
    wget
    ripgrep
    eza
    fish
    zoxide
    fzf
    bat
    btop
    dua
    alejandra
    manix
  ];
}
