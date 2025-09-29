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
    # services.pipewire.extraConfig.pipewire."50-combined_stream" = {
    #   "context.modules" = [
    #     {
    #       name = "libpipewire-module-combine-stream";
    #       args = {
    #         "combine.mode" = "sink";
    #         "node.name" = "combine_sink";
    #         "node.description" = "Combined";
    #         "combine.latency-compensate" = false;
    #         "combine.props" = {
    #           "audio.position" = [
    #             "FL"
    #             "FR"
    #           ];
    #         };
    #         "stream.props" = { };
    #         "stream.rules" = [
    #           {
    #             matches = [ { "media.class" = "Audio/Sink"; } ];
    #             actions.create-stream = { };
    #           }
    #         ];
    #       };
    #     }
    #   ];
    # };
  };
}
