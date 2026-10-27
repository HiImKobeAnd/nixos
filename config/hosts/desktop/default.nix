{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.hiimkobeand = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.desktopConfiguration
      inputs.sops-nix.nixosModules.sops
    ];
  };
}
