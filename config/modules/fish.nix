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
            # ls = "${pkgs.eza}/bin/eza --group-directories-first";
            # la = "${pkgs.eza}/bin/eza --all";
            # lt = "${pkgs.eza}/bin/eza -R --level=1";
            # ltt = "${pkgs.eza}/bin/eza -R --level=2";
            # lttt = "${pkgs.eza}/bin/eza -R --level=3";
          };
          interactiveShellInit = ''
            set -U fish_greeting
            set fish_prompt_pwd_dir_length 0

            ls() {
            ${pkgs.eza}/bin/eza --group-directories-first "$@"
            }
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
