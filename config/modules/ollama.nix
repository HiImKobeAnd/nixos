{ ... }:
{
  flake.nixosModules.ollama =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        ollama
        opencode
        mistral-vibe
      ];
      services.ollama = {
        enable = true;
        package = pkgs.ollama-cuda;
        host = "0.0.0.0";
      };
    };
}
