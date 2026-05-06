{ ... }:
{
  flake.nixosModules.ollama =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        ollama
        alpaca
        opencode
      ];
      services.ollama = {
        enable = true;
        package = pkgs.ollama-cuda;
      };
    };
}
