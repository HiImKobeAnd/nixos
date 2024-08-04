{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nil

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
