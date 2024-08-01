{ pkgs, ... }:

{
	nixpkgs.config.allowUnfree = true;

	programs.firefox.enable = true;
	programs.steam.enable = true;
}
