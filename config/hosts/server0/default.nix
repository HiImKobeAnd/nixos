{ self, inputs, ... }:
{
  flake.nixosConfigurations.server0 = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.server0Configuration
    ];
  };
}
