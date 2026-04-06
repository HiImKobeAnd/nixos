{ ... }:
{
  flake.nixosModules.learning =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        anki
        zotero
        obsidian
      ];
    };
}
