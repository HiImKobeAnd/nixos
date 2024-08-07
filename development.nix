{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    rustup
    cargo-watch
    cargo-audit
    nodejs_22
    nodePackages.pnpm
  ];
}
