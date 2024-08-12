{
  inputs,
  pkgs,
  ...
}: {
  virtualisation.docker.enable = true;
  users.users.hiimkobeand.extraGroups = ["docker"];
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  environment.systemPackages = with pkgs; [
    nodejs_22
    nodePackages.pnpm
    nodePackages.prettier

    sqlite
    sqlx-cli
    postgresql_16

    lua-language-server
    nil

    gcc14
    mold
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
