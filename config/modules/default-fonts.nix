{ ... }:
{
  flake.nixosModules.default-fonts =
    { pkgs, ... }:
    {
      fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        nerd-fonts.symbols-only
      ];
      fonts.fontconfig.antialias = true;
    };
}
