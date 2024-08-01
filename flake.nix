{
  description = "hiimkobeand's nixos config";

  inputs = {
   	nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
	alejandra.url = "github:kamadorueda/alejandra/3.0.0";
	alejandra.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { alejandra, nixpkgs, ... }@ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs; };
    modules = [
      	./system/bootloader.nix
	./system/networking.nix
	./system/sound.nix
	./system/users.nix
	./system/nix-settings.nix	

     	./hardware-configuration.nix
	./configuration.nix
	./locale.nix

	./gnome.nix
	./applications.nix
	./terminal-utils.nix	
	
	./development/nix-dev.nix
      	];
	};
    	};
}
