{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    firefox
    youtube-music
    geary
  ];
}