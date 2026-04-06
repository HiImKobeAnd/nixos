{ ... }:
{
  flake.nixosModules.obs-studio =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        obs-studio
      ];
      programs.obs-studio = {
        enable = true;
        package = (
          pkgs.obs-studio.override {
            cudaSupport = true;
          }
        );
        plugins = with pkgs.obs-studio-plugins; [
          wlrobs
          obs-pipewire-audio-capture
          obs-backgroundremoval
        ];
      };
    };
}
