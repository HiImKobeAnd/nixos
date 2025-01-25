{
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
    sqlite
    sqlx-cli
    postgresql_16

    jdk

    gcc14
    mold
    lldb_18
    cargo-watch
    cargo-audit
    rustup
  ];
}
