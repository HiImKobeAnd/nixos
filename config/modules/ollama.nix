{ ... }:
{
  flake.nixosModules.ollama =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        ollama
        alpaca
        opencode
        mistral-vibe
      ];
      services.ollama = {
        enable = true;
        package = pkgs.ollama-cuda;
      };
    };
}
