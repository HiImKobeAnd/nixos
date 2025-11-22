{ lib, ... }:
{
  options.modules.desktop = lib.mkOption {
    type = lib.types.enum [
      "none"
      "hyprland"
      "gnome"
      "cosmic"
      "kde"
    ];
    default = "none";
    description = "The desktop environment to be used.";
  };
}
