{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    curl
    wget
    zip
    unzip 
    ripgrep
    dua
    btop
    bat

    gh
    koji    

    nil
    nh
    any-nix-shell
    #dconf2nix

    lua-language-server
    nixfmt-rfc-style
    
    quickemu
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
