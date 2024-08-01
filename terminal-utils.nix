{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		vim
		git
		wget
		ripgrep
		eza
		zoxide
		btop
		dua
	];
}
