{pkgs, ...}: {
  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-font-patcher
  ];
  fonts = {
    fontconfig = {
      antialias = true;
    };
  };
}
