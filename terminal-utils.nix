{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nil
    curl
    git
    wget
    ripgrep
    eza
    zoxide
    btop
    dua
    alejandra
    manix
  ];
}
