{
  inputs,
  pkgs,
  ...
}: {
  programs.noisetorch.enable = true;
  environment.systemPackages = with pkgs; [
    firefox
    inputs.zen-browser.packages."x86_64-linux".default
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
