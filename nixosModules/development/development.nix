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

    jdk

    gcc14
    mold
    lldb_18
    cargo-watch
    #cargo-audit
    rustup
    #rust-bin.stable.latest.default
    #(rust-bin.fromRustupToolchainFile ./rust-toolchain.toml)
  ];
  nixpkgs.overlays = [
    inputs.rust-overlay.overlays.default
  ];
}
