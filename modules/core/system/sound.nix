{ lib, config, ... }:
{
  config = lib.mkIf config.modules.sound.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      extraConfig.pipewire = {
        "context-properties" = {
          "default.clock.rate" = 48000;
          "default.clock.quantum" = 2048;
          "default.clock.min-quantum" = 1024;
          "default.clock.max-quantum" = 4096;
        };
      };
    };
  };
}
