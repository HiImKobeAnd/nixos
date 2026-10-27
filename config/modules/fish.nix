_: {
  flake.nixosModules.fish = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      eza
      fishPlugins.bass
    ];
    programs = {
      fish = {
        enable = true;
        shellAliases = {
          ls = "${pkgs.eza}/bin/eza --group-directories-first";
          la = "${pkgs.eza}/bin/eza --group-directories-first --all";
        };
        interactiveShellInit = ''
          set -U fish_greeting
          set fish_prompt_pwd_dir_length 0
        '';
      };
    };
  };
}
