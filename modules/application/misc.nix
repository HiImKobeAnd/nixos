{
  inputs,
  pkgs,
  ...
}: {
  programs.noisetorch.enable = true;
  programs.kdeconnect.enable = true;
  virtualisation.waydroid.enable = true;
  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."x86_64-linux".default
    thunderbird
    youtube-music
    libreoffice
    obsidian
    qemu
    swtpm
    noisetorch
    krita
    openvpn
    (chromium.override {enableWideVine = true;})
    waydroid
    valent
  ];
}
