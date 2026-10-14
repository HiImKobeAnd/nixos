{
  self,
  inputs,
  ...
}:
{
  flake.nixosModules.deploy-rs = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      deploy-rs
    ];
  };

  flake.deploy.nodes.server0 = {
    hostname = "192.168.100.233";
    profiles.system = {
      user = "root";
      path = inputs.deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.server0;
    };
  };

  flake.checks = builtins.mapAttrs (
    system: deployLib: deployLib.deployChecks self.deploy
  ) inputs.deploy-rs.lib;
}
