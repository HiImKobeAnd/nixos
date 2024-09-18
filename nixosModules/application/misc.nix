{pkgs, ...}: {
  programs.noisetorch.enable = true;
  environment.systemPackages = with pkgs; [
    firefox
    thunderbird
    bitwarden
    youtube-music
    geary
    libreoffice
    zathura
    porsmo
    obsidian
    calibre
    virt-manager
    qemu
    swtpm
    noisetorch
    denaro
  ];
}
