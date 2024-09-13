{pkgs, ...}: {
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    nerdfonts
    nerd-font-patcher
  ];
  fonts = {
    fontconfig = {
      antialias = true;
    };
  };
}
