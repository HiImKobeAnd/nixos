{ inputs, ... }:
{
  flake.nixosModules.nixcord =
    { pkgs, lib, ... }:
    let
      vesktop-global-shortcuts = builtins.fetchTarball {
        url = "https://github.com/Vencord/Vesktop/archive/refs/heads/global-shortcuts.tar.gz";
        sha256 = "sha256:1i1f28h4fh6y88a5h5xjlligbvdbnb8lz3k9hih031bqwyh90qbb";
      };
    in
    {
      imports = [
        inputs.nixcord.nixosModules.nixcord
      ];
      programs.nixcord = {
        enable = true;
        discord.enable = false;
        vesktop.enable = true;

        vesktop.package =
          (pkgs.vesktop.override {
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
                  pnpm = pkgs.pnpm_11;
                  fetcherVersion = 4;
                  hash = "sha256-xvb3DfqmcCyOpGHaGjeCJxClfVcHpdezyzxLXNiz72k=";
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
            clearUrls.enable = true;
            webScreenShareFixes.enable = true;
          };
        };
      };
    };
}
