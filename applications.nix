{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    firefox
    steam
    lutris
    vesktop
    youtube-music
    geary
    cosmic-store
  ];
}
