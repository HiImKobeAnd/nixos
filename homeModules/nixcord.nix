{ inputs, ... }:
{
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];
  programs.nixcord = {
    enable = true;
    discord.openASAR.enable = false;
    vesktop.enable = false;
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
        callTimer.enable = true;
        clearURLs.enable = true;
        fakeNitro = {
          enable = true;
          enableEmojiBypass = false;
        };
        moreKaomoji.enable = true;
        mutualGroupDMs.enable = true;
        youtubeAdblock.enable = true;
        messageClickActions.enable = true;
        noTrack.enable = true;
        shikiCodeblocks.enable = true;
        volumeBooster.enable = true;
        dearrow.enable = true;
        dearrow.hideButton = true;
        moreCommands.enable = true;
        reverseImageSearch.enable = true;
      };
    };
  };
}
