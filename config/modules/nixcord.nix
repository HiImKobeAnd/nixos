{ inputs, ... }:
{
  flake.nixosModules.nixcord =
    { pkgs, lib, ... }:
    let
      vesktop-global-shortcuts = builtins.fetchTarball {
        url = "https://github.com/Vencord/Vesktop/archive/refs/heads/global-shortcuts.tar.gz";
        sha256 = "sha256:16f42bn8k4j2avm5rzr9lkmqrmp3b27b2l1nqp4mgmiy9pas1ry5";
      };
    in
    {
      imports = [
        inputs.nixcord.nixosModules.nixcord
      ];
      programs.nixcord = {
        enable = true;
        discord.vencord.enable = true;
        vesktop.enable = true;

        vesktop.package =
          (pkgs.vesktop.override {
            electron_40 = pkgs.electron_41;
          }).overrideAttrs
            (
              oldAttrs:
              let
                src = vesktop-global-shortcuts;
              in
              {
                inherit src;
                pnpmDeps = pkgs.fetchPnpmDeps {
                  pname = "vesktop";
                  version = "1.6.5";
                  inherit src;
                  patches = [ ];
                  pnpm = pkgs.pnpm_10_29_2;
                  fetcherVersion = 3;
                  hash = "sha256-TuFTXDrgLGJD0jaTeo66eHpHLjHKYofrZwn61aQLArY=";
                };
              }
            );

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
