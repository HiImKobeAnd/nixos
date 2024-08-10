{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    element-desktop
    discord
    firefox
    thunderbird
    youtube-music

    vscode
    alacritty

    lutris
    steam
    prismlauncher
    heroic
    parsec-bin

    geary
  ];
}
