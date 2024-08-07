{
  pkgs,
  aagl,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  programs.steam.enable = true;
  programs.honkers-railway-launcher.enable = true;

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
    prismlauncher
  ];
}
