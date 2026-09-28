{ ... }:
{
  flake.nixosModules.steam =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        gamemode
        protonplus
      ];

      programs = {
        steam = {
          enable = true;
          gamescopeSession.enable = true;
          remotePlay.openFirewall = true;
        };
        gamemode.enable = true;
      };
      environment.etc."openxr/1/active_runtime.json".text = ''
        {
          "file_format_version": "1.0.0",
          "runtime": {
            "VALVE_runtime_is_steamvr": true,
            "library_path": "/home/hiimkobeand/.local/share/Steam/steamapps/common/SteamVR/bin/linux64/vrclient.so",
            "name": "SteamVR"
          }
        }
      '';
    };
}
