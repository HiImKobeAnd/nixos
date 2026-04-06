{ ... }:
{
  flake.nixosModules.minecraft =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        (prismlauncher.override {
          additionalPrograms = [ ffmpeg ];
          jdks = [
            temurin-bin
            temurin-jre-bin-17
          ];
        })
      ];
    };
}
