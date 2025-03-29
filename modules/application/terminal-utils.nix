{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    curl
    wget
    zip
    unzip
    any-nix-shell
    #dconf2nix
    nil
    nh
    ripgrep
    dua
    btop
    bat
    gh
    koji
  ];
  programs = {
    bash = {
      interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };
  };
}
