{
  inputs,
  pkgs,
  ...
}: {
  programs.noisetorch.enable = true;
  virtualisation.waydroid.enable = true;
  environment.systemPackages = with pkgs; [
    firefox
    inputs.zen-browser.packages."x86_64-linux".default
    thunderbird
    youtube-music
    libreoffice
    zathura
    obsidian
    virt-manager
    qemu
    swtpm
    noisetorch
    gimp
    (chromium.override {enableWideVine = true;})
    widevine-cdm
    waydroid
  ];
}
