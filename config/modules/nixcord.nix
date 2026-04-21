{ inputs, ... }:
{
  flake.nixosModules.nixcord =
    { pkgs, ... }:
    {
      imports = [
        inputs.nixcord.nixosModules.nixcord
      ];
      programs.nixcord = {
        enable = true;
        user = "hiimkobeand";
        discord.openASAR.enable = true;
        vesktop.package = pkgs.vesktop.overrideAttrs (old: {
          src = pkgs.fetchFromGitHub {
            owner = "Vencord";
            repo = "Vesktop";
            rev = "global-shortcuts"; # or pin to a specific commit SHA for reproducibility
            hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
          };
        });
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
