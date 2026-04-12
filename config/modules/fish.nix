{ ... }:
{
  flake.nixosModules.fish =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        eza
      ];
      programs = {
        fish = {
          enable = true;
          shellAliases = {
            ls = "${pkgs.eza} --group-directories-first";
            la = "${pkgs.eza} --all";
            lt = "${pkgs.eza} -R --level=1";
            ltt = "${pkgs.eza} -R --level=2";
            lttt = "${pkgs.eza} -R --level=3";
          };
          interactiveShellInit = ''
            set -U fish_greeting
            set fish_prompt_pwd_dir_length 0
          '';
        };
        bash.enable = true;
      };
    };
}
