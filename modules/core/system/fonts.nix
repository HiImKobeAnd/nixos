{pkgs, ...}: {
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    nerd-fonts.noto
    nerd-fonts.symbols-only
    nerd-font-patcher
  ];
  fonts = {
    fontconfig = {
      antialias = true;
    };
  };
}
