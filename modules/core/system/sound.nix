{ lib, config, ... }:
{
  config = lib.mkIf config.modules.sound.enable {
    security.rtkit.enable = true;
    services.pipewire.audio.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      extraConfig.pipewire."92-low-latency" = {
        "context-properties" = {
          "default.clock.rate" = 48000;
          "default.clock.allowed-rates" = [
            44100
            48000
          ];
          "default.clock.min-quantum" = 1024;
          "default.clock.max-quantum" = 2048;
        };
      };
    };
    services.pipewire.extraConfig.pipewire."50-combined_stream" = {
      "context.modules" = [
        {
          name = "libpipewire-module-combine-stream";
          args = {
            "combine.mode" = "sink";
            "node.name" = "combine_sink";
            "node.description" = "Combined";
            "combine.latency-compensate" = true;
            "combine.props" = {
              "audio.position" = [
                "FL"
                "FR"
              ];
              "dont-export-monitor" = true;
            };
            "stream.props" = { };
            "stream.rules" = [
              {
                matches = [
                  { "media.class" = "Audio/Sink"; }
                  # { "node.name" = "alsa_output.pci-0000_01_00.1.hdmi-stereo"; }
                  # { "node.name" = "alsa_output.usb-Logitech_PRO_X_000000000000-00.pro-output-0"; }
                ];
              }
            ];
          };
        }
      ];
    };
    services.pipewire.wireplumber.extraConfig."10-logitech-fix" = {
      "monitor.alsa.rules" = [
        {
          matches = [
            { "node.name" = "~alsa-output.usb-Logitech.*"; }
          ];
          actions = {
            update-props = {
              "audio.format" = "S16LE";
              "api.alsa.period-size" = 1024;
              "api.alsa.headroom" = 512;
            };
          };
        }
      ];
    };
    services.udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="046d", ATTR{idProduct}=="0aaa", ATTR{power/control}="on", ATTR{power/autosuspend}="-1"
    '';
  };
}
