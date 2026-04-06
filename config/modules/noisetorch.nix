{ ... }:
{
  flake.nixosModules.audio-applications =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        noisetorch
        easyeffects
      ];
      programs.noisetorch.enable = true;
    };
}
