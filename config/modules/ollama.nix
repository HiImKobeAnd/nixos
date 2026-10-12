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
      services.open-webui.enable = true;
      systemd.services.ollama = {
        after = [ "graphical.target" ];
        wantedBy = lib.mkForce [ "graphical.target" ];
      };
      virtualisation.oci-containers.containers.odysseus = {
        image = "ghcr.io/odysseus-dev/odysseus:latest";
        ports = [ "7000:7000" ];
        volumes = [
          "/var/lib/odysseus/data:/app/data"
        ];
        environment = {
          APP_BIND = "0.0.0.0";
          APP_PORT = "7000";
          AUTH_ENABLED = "true";
        };
        extraOptions = [ "--add-host=host.docker.internal:host-gateway" ];
      };
    };
}
