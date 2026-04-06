{ ... }:
{
  flake.nixosModules.ollama =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        ollama
        alpaca
      ];
      services.ollama = {
        enable = true;
        acceleration = "cuda";
      };
    };
}
