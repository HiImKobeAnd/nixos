_: {
  flake.nixosModules.learning = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      anki
      zotero
      obsidian
      readest
      # super-productivity
    ];
  };
}
