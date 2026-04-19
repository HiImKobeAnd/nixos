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
        discord.openASAR.enable = false;
        vesktop.enable = true;
        config = {
          themeLinks = [
            "https://raw.githubusercontent.com/Costeer/Gruvbox-Material-Themes/refs/heads/main/Discord%20Theme/materialgruvbox-2.theme.css"
          ];
          plugins = {
            betterFolders = {
              enable = false;
              sidebarAnim = false;
              closeAllFolders = true;
              closeAllHomeButton = true;
              closeOthers = true;
            };
            fakeNitro = {
              enable = true;
              enableEmojiBypass = false;
            };
            youtubeAdblock.enable = true;
            messageClickActions.enable = true;
            shikiCodeblocks.enable = true;
            volumeBooster.enable = true;
            dearrow.enable = true;
            dearrow.hideButton = true;
            reverseImageSearch.enable = true;
            webKeybinds.enable = true;
          };
        };
      };
    };
}
