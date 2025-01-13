{...}: {
  security.rtkit.enable = true;
  #hardware.pulseaudio.enable = true;
  #hardware.pulseaudio.support32Bit = true;
  #hardware.pulseaudio.extraConfig = "load-module module-combine-sink";
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    extraConfig.pipewire."91-combine-bluetooth-inputs" = {
      "context.modules" = [
        {
          name = "libpipewire-module-combine-sink";
          args = {
            "combine.mode" = "sink";
            "node.name" = "combined_output";
            "node.description" = "Combined Output";
            "combine.latency-compensate" = false;
            "filter.media.class" = "Audio/Sink";
          };
        }
      ];
    };
  };
}
