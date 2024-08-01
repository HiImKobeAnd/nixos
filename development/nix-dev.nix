{ alejandra, pkgs, ... }:

{
	environment.systemPackages = [alejandra.defaultPackage.${system}];
}
