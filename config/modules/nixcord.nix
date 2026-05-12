{ inputs, ... }:
{
  flake.nixosModules.nixcord =
    { pkgs, ... }:
    {
      imports = [
        inputs.nixcord.nixosModules.nixcord
      ];
      environment.systemPackages = with pkgs; [
        discover-overlay
      ];
      programs.nixcord = {
        enable = true;
        user = "hiimkobeand";
        config = {
          themeLinks = [
            "https://raw.githubusercontent.com/Costeer/Gruvbox-Material-Themes/refs/heads/main/Discord%20Theme/materialgruvbox-2.theme.css"
          ];
          plugins = {
            fakeNitro = {
              enable = true;
              enableStreamQualityBypass = true;
            };
            youtubeAdblock.enable = true;
            messageClickActions.enable = true;
            shikiCodeblocks.enable = true;
            volumeBooster.enable = true;
            dearrow.enable = true;
            dearrow.hideButton = true;
          };
        };
      };
    };
}
