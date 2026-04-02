{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.modules.services.screen-powerstate-services.enable {
    # Turn monitor OFF on Shutdown/Reboot
    systemd.services.monitor-off-shutdown = {
      description = "Turn monitor off on shutdown";
      before = [
        "poweroff.target"
        "reboot.target"
        "halt.target"
      ];
      wantedBy = [
        "poweroff.target"
        "reboot.target"
        "halt.target"
      ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.ddcutil}/bin/ddcutil setvcp d6 04"; # Run on shutdown
      };
    };

    # Turn monitor ON at Boot
    systemd.services.monitor-on-boot = {
      description = "Turn monitor on at boot";
      after = [
        "display-manager.service"
        "graphical.target"
      ];
      wantedBy = [ "graphical.target" ];

      serviceConfig = {
        Type = "oneshot";
        ExecStartPre = "${pkgs.coreutils}/bin/sleep 2";
        ExecStart = "${pkgs.ddcutil}/bin/ddcutil --noverify --sleep-multiplier 2 setvcp d6 01";
      };
    };

    # Turn monitor OFF on Sleep
    systemd.services.monitor-off-sleep = {
      description = "Turn monitor off before sleep";
      before = [ "sleep.target" ];
      wantedBy = [ "sleep.target" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.ddcutil}/bin/ddcutil setvcp d6 04";
      };
    };

    # Turn monitor ON on Wake
    systemd.services.monitor-on-wake = {
      description = "Turn monitor on after wake";
      after = [
        "suspend.target"
        "hibernate.target"
        "hybrid-sleep.target"
      ];
      wantedBy = [
        "suspend.target"
        "hibernate.target"
        "hybrid-sleep.target"
      ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.ddcutil}/bin/ddcutil setvcp d6 01";
      };
    };
  };
}
