_: {
  nix = {
    optimise.automatic = true;
    settings.auto-optimise-store = true;
    settings.experimental-features = ["nix-command" "flakes"];
  };
}
