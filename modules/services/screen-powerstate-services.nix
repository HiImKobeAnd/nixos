{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.modules.services.screen-powerstate-services.enable {
    systemd.services.ddc-monitor-off = {
      description = "Turn off monitor before sleep/shutdown";
      before = [
        "sleep.target"
        "shutdown.target"
      ];
      wantedBy = [
        "sleep.target"
        "shutdown.target"
      ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "-${pkgs.ddcutil}/bin/ddcutil setvcp d6 05";

        TimeoutStopSec = "10s";
      };
    };

    systemd.services.ddc-monitor-on = {
      description = "Turn on monitor after wake";
      after = [
        "suspend.target"
        "hibernate.target"
      ];
      wantedBy = [
        "suspend.target"
        "hibernate.target"
      ];
      serviceConfig = {
        Type = "oneshot";
        ExecStartPre = "${pkgs.coreutils}/bin/sleep 1";
        ExecStart = "-${pkgs.ddcutil}/bin/ddcutil setvcp d6 01";
      };
    };
  };
}
