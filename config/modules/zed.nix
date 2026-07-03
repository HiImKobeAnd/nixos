{ ... }:
{
  flake.nixosModules.zed =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        zed-editor
        nixd
        rustc
        rust-analyzer
      ];
      programs.nix-ld.enable = true;
      programs.nix-ld.libraries = with pkgs; [
        stdenv.cc.cc
        zlib
        openssl
        glib
        curl
      ];
    };
}
