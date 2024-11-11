{
  inputs,
  pkgs,
  ...
}: {
  programs.noisetorch.enable = true;
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
    gimp
    (chromium.override {enableWideVine = true;})
    waydroid
  ];
}
