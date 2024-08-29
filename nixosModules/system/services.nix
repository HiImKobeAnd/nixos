{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    syncthing
    spice
    rnnoise-plugin
  ];
  services.syncthing = {
    enable = true;
    overrideDevices = false;
    overrideFolders = false;
    user = "hiimkobeand";
    openDefaultPorts = true;

    dataDir = "/home/hiimkobeand";
    configDir = "/home/hiimkobeand/.config/syncthing";
  };
  services.flatpak.enable = true;

  services.spice-vdagentd.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    extraConfig.pipewire = {
      name = "libpipewire-module-filter-chain";
      args = {
        node.description = "Noise Canceling source";
        media.name = "Noise Canceling source";
        filter.graph = {
          nodes = [
            {
              type = "ladspa";
              name = "rnnoise";
              plugin = "${pkgs.rnnoise-plugin}/lib/ladspa/librnnoise_ladspa.so";
              label = "noise_suppressor_mono";
              control = {"VAD Threshold (%)" = 50.0;};
            }
          ];
        };
        capture.props = {
          node.name = "capture.rnnoise_source";
          node.passive = true;
        };
        playback.props = {
          node.name = "rnnoise_source";
          media.class = "Audio/Source";
        };
      };
    };
  };

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            "pageup" = "playpause";
            "pagedown" = "nextsong";
            "home" = "f23";
            "end" = "f24";
            #rightalt = "layer(rightalt)";
          };
          rightalt = {
            "pageup" = "pageup";
            "pagedown" = "pagedown";
            "home" = "home";
            "end" = "end";
          };
        };
      };
    };
  };
}
