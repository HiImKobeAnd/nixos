_: {
  flake.nixosModules.steam = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      gamemode
      protonplus
    ];

    programs = {
      steam = {
        enable = true;
        package = pkgs.steamWithMillennium;
        gamescopeSession.enable = true;
        remotePlay.openFirewall = true;
      };
      gamemode.enable = true;
    };
    services.wivrn = {
      enable = true;
      openFirewall = true;
      package = pkgs.wivrn.override {cudaSupport = true;};
    };
  };
}
