{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    firefox
    steam
    lutris
    discord
    vencord
    youtube-music
    geary
    alacritty
  ];
}
