{
  lib,
  config,
  ...
}: {
  options = {
    theme = lib.mkOption {
      type = lib.types.enum ["gruvbox" "catppuccin"];
      default = "catppuccin";
      description = "Choose the color theme for the system.";
    };
  };
  config = {
    stylix = {
      enable = true;
      autoEnable = true;
      polarity = "dark";
      image = ./background-image.jpg;
      cursor.size = 20;
      fonts.sizes = {
        desktop = 8;
        applications = 10;
        popups = 8;
      };

      base16Scheme =
        lib.mkIf (config.theme == "gruvbox") {
          base00 = "32302f"; # ----
          base01 = "3c3836"; # ---
          base02 = "504945"; # --
          base03 = "665c54"; # -
          base04 = "bdae93"; # +
          base05 = "d5c4a1"; # ++
          base06 = "ebdbb2"; # +++
          base07 = "fbf1c7"; # ++++
          base08 = "fb4934"; # red
          base09 = "fe8019"; # orange
          base0A = "fabd2f"; # yellow
          base0B = "b8bb26"; # green
          base0C = "8ec07c"; # aqua/cyan
          base0D = "83a598"; # blue
          base0E = "d3869b"; # purple
          base0F = "d65d0e"; # brown
        }
        // lib.mkIf (config.theme == "catppuccin") {
          base00 = "24273a"; # base
          base01 = "1e2030"; # mantle
          base02 = "949cbb"; # surface0
          base03 = "494d64"; # surface1
          base04 = "5b6078"; #surface2
          base05 = "cad3f5"; # text
          base06 = "f4dbd6"; # rosewater
          base07 = "b7bdf8"; # lavender
          base08 = "ed8796"; # red
          base09 = "f5a97f"; # peach
          base0A = "eed49f"; # yellow
          base0B = "a6da95"; # green
          base0C = "8bd5ca"; # teal
          base0D = "8aadf4"; # blue
          base0E = "c6a0f6"; # mauve
          base0F = "f0c6c6"; # flamingo
        };
    };
  };
}
