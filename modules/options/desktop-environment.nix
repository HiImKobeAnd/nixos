{ lib, ... }:
{
  options.modules.desktop = lib.mkOption {
    type = lib.types.enum [
      "none"
      "hyprland"
      "gnome"
      "cosmic"
    ];
    default = "none";
    description = "The desktop environment to be used.";
  };
}
