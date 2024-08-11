{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  programs.steam.enable = true;
  programs.steam.remotePlay.openFirewall = true;

  environment.systemPackages = with pkgs; [
    element-desktop
    discord
    firefox
    thunderbird
    youtube-music

    vscode
    putty
    alacritty

    lutris
    steam
    prismlauncher
    heroic
    parsec-bin
    gamemode

    geary
  ];
}
