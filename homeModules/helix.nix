{ lib, pkgs, ... }:
{
  programs.helix = {
    enable = true;
    package = pkgs.evil-helix;
    languages.language = [
      {
        name = "nix";
        language-servers = [ "nixd" ];
        formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
      }
    ];
    settings = {
      theme = "gruvbox";
      editor = {
      auto-format = true;
        lsp.display-inlay-hints = true;
      };
    };
    extraPackages = with pkgs; [
        rust-analyzer
      vscode-langservers-extracted
      markdown-oxide
      nixfmt-rfc-style
      nixd
    ];
  };
}
