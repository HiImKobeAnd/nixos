{ inputs, ... }:
{
  flake.nixosModules.nixcord =
    { ... }:
    {
      imports = [
        inputs.nixcord.nixosModules.nixcord
      ];
      programs.nixcord = {
        enable = true;
        user = "hiimkobeand";
        discord.openASAR.enable = true;
        vesktop.enable = false;
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
