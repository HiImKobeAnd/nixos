{inputs, ...}: {
  imports = [
    inputs.nixcord.homeManagerModules.nixcord
  ];
  programs.nixcord = {
    enable = false;
    discord.openASAR.enable = true;
    config = {
      themeLinks = ["https://catppuccin.github.io/discord/dist/catppuccin-macchiato-flamingo.theme.css"];
      plugins = {
        betterFolders = {
          enable = true;
          sidebarAnim = false;
          closeAllFolders = true;
          closeAllHomeButton = true;
          closeOthers = true;
        };
        callTimer.enable = true;
        clearURLs.enable = true;
        fakeNitro.enable = true;
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
