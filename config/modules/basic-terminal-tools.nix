{ ... }:
{
  flake.nixosModules.basic-terminal-tools =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        curl
        wget
        zip
        unzip
        ripgrep
        dua
        btop-cuda
        bat
        tldr
        just
      ];
    };
}
