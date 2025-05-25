{ lib, pkgs, ... }:
{
  programs.helix = {
    enable = true;
    package = pkgs.evil-helix;
    languages.language = [
      {
        name = "nix";
        language-servers = [ "nixd" ];
        formatter.binary = "${lib.getExe pkgs.nixfmt-rfc-style}";
        formatter.command = "nixfmt";
      }
    ];
    settings = {
    theme = "gruvbox";
      editor = {
        auto-format = true;
        lsp.enable = true;
        lsp.display-messages = true;
        lsp.display-inlay-hints = true;
        smart-tab.enable = true;
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
