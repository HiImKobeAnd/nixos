{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.modules.fonts.enable {
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      nerd-fonts.noto
    ];
    fonts = {
      fontconfig = {
        # defaultFonts = {
        # serif = [ "Noto Font"]
        # }
        antialias = true;
      };
    };
  };
}
