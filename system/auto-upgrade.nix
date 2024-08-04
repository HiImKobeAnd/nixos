{...}: {
  system.autoUpgrade = {
    enable = true;
    operation = "boot";
    flake = "/home/hiimkobeand/.dotfiles/nixos";
    dates = "daily";
  };
}
