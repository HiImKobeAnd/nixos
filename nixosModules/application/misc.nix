{
  inputs,
  pkgs,
  ...
}: {
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
  ];

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
    sioyek
    porsmo
    obsidian
    virt-manager
    qemu
    swtpm
    noisetorch
    denaro
    gimp
    komikku
    (vivaldi.override {
      proprietaryCodecs = true;
      enableWidevine = true;
    })
    (chromium.override {enableWideVine = true;})
  ];
}
