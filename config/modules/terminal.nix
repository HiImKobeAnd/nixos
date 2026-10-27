_: {
  flake.nixosModules.terminal = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      kitty
      ghostty
      alacritty
      fzf
    ];
    programs = {
      starship.enable = true;
      fzf.fuzzyCompletion = true;
      zoxide = {
        enable = true;
        enableFishIntegration = true;
        flags = ["--cmd cd"];
      };
    };
  };
}
