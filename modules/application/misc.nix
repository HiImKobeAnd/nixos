{
  inputs,
  pkgs,
  ...
}:
{
  programs.noisetorch.enable = true;
  programs.kdeconnect.enable = true;
  virtualisation.waydroid.enable = true;
  environment.systemPackages = with pkgs; [
    thunderbird
    youtube-music
    #libreoffice
    libreoffice-fresh
    obsidian
    qemu
    swtpm
    anki
    noisetorch
    krita
    #openvpn
    (chromium.override { enableWideVine = true; })
    waydroid
    #mokuro
  ];
}
