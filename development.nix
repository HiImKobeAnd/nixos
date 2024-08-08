{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    nodejs_22
    nodePackages.pnpm

    lldb_18
    rustup
    cargo-watch
    cargo-audit
    (rust-bin.fromRustupToolchainFile ./rust-toolchain.toml)
  ];
  nixpkgs.overlays = [
    inputs.rust-overlay.overlays.default
  ];
}
