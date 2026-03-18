{ inputs, lib, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      gnomeExtensions = prev.gnomeExtensions // {
        pop-shell = prev.gnomeExtensions.pop-shell.overrideAttrs (oldAttrs: {
          src = final.fetchFromGitHub {
            owner = "sasilanz";
            repo = "shell";
            rev = "fix-gnome-49-compatibility";
            hash = "sha256-vgpw8INbzTiWfPmIXXYeBT12E4qFlUTeGEz1K/HPjZw=";
          };
        });
      };
    })
  ];
}
