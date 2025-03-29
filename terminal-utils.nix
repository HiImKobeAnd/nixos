{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    quickemu

    #lua-language-server

    #nixfmt-rfc-style
  ];
}
