_: {
  flake.nixosModules.git = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.koji
      pkgs.gh
      pkgs.delta
      pkgs.jj
    ];
    programs.git = {
      enable = true;
      lfs.enable = true;
    };
  };
}
