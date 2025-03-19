{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    spice
  ];
  services.flatpak.enable = true;

  services.spice-vdagentd.enable = true;

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            "pageup" = "playpause";
            "pagedown" = "nextsong";
            "home" = "f23";
            "end" = "f24";
            #rightalt = "layer(rightalt)";
          };
          rightalt = {
            "pageup" = "pageup";
            "pagedown" = "pagedown";
            "home" = "home";
            "end" = "end";
          };
          leftmeta = {
            "f12" = "brightnessdown";
            "f11" = "brightnessup";
          };
        };
      };
    };
  };
}
