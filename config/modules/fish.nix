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
        bash = {
          enable = true;
          interactiveShellInit = ''
            if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
            then
              shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
              exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
            fi
          '';
        };
      };
    };
}
