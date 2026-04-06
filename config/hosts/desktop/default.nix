{ self, inputs, ... }:
{
  flake.nixosConfigurations.hiimkobeand = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.desktopConfiguration
    ];
  };
}
