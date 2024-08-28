{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    firefox
    youtube-music
    geary
    libreoffice
    zathura
    porsmo
    obsidian
    calibre
    virt-manager
    qemu
  ];
}
