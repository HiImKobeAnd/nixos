{ ... }:
{
  flake.nixosModules.terminal =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        kitty
        ghostty
        fzf
        yazi
      ];
      programs = {
        starship.enable = true;
        fzf.fuzzyCompletion = true;
        zoxide = {
          enable = true;
          enableFishIntegration = true;
          flags = [ "--cmd cd" ];
        };
      };
    };
}
