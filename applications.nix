{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    firefox
    steam
    lutris
    discord
    youtube-music
    geary
    alacritty
    thunderbird
    vscode
  ];
}
