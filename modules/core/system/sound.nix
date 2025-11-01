{ lib, config, ... }:
{
  config = lib.mkIf config.modules.sound.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    services.pipewire.extraConfig.pipewire."50-combined_stream" = {
      "context.modules" = [
        {
          name = "libpipewire-module-combine-stream";
          args = {
            "combine.mode" = "sink";
            "node.name" = "combine_sink";
            "node.description" = "Combined";
            "combine.latency-compensate" = false;
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
                  # { "media.class" = "Audio/Sink"; }
                  { "node.name" = "alsa_output.pci-0000_01_00.1.hdmi-stereo"; }
                  { "node.name" = "alsa_output.usb-Logitech_PRO_X_000000000000-00.pro-output-0"; }
                ];
                actions.create-stream = { };
              }
            ];
          };
        }
      ];
    };
  };
}
