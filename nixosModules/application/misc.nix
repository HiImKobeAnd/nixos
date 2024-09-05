{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    firefox
    thunderbird
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
  ];
}
