{...}: {
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    extraConfig.pipewire-pulse = {
      pulse.cmd = [
        {
          cmd = "load-module";
          args = "module-combine-sink";
        }
      ];
    };
  };
}
