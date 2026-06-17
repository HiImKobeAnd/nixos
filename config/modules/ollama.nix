{ lib, ... }:
{
  flake.nixosModules.ollama =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        ollama
      ];
      services.ollama = {
        enable = true;
        package = pkgs.ollama-cuda;
        host = "0.0.0.0";
      };
      systemd.services.ollama = {
        after = [ "graphical.target" ];
        wantedBy = lib.mkForce [ "graphical.target" ];
      };
    };
}
