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
    gh
    dua
    alejandra
    manix
    dconf2nix
  ];
}
