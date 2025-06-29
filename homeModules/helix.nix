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
        auto-format = true;
      }
    ];
    settings = {
      theme = "gruvbox";
      editor = {
        lsp.display-inlay-hints = true;
        cursor-shape = {
          insert = "bar";
        };
      };
    };
    extraPackages = with pkgs; [
      rust-analyzer
      just-lsp
      taplo
      lldb
      marksman
      texlab
      elixir-ls
      typescript-language-server
      docker-language-server
      vscode-langservers-extracted
      markdown-oxide
      nixfmt-rfc-style
      nixd
    ];
  };
}
