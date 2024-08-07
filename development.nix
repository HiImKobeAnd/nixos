{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    rustup
    cargo-watch
    cargo-audit
    bun
  ];
}
