{ pkgs, ... }:

{
	users.users.hiimkobeand = {
	isNormalUser = true;
	description = "Kobe";
	extraGroups = ["networkmanager" "wheel" ];
	};
}
