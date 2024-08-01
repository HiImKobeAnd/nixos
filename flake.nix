{
  description = "hiimkobeand's nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs, ... }@ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = [
      	./system/bootloader.nix
	./system/networking.nix
	./system/sound.nix
	
	./locale.nix
	./gnome.nix
	
	./configuration.nix
     	./hardware-configuration.nix  
      ];
};
    };
}
