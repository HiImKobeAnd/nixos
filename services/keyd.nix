{ ... }:
{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            "pageup" = "playpause";
            "pagedown" = "nextsong";
            "home" = "f23";
            "end" = "f24";
            "capslock" = "capslayer";
            #rightalt = "layer(rightalt)";
          };
          rightalt = {
            "pageup" = "pageup";
            "pagedown" = "pagedown";
            "home" = "home";
            "end" = "end";
          };
          meta = {
            "f1" = "brightnessdown";
            "f2" = "brightnessup";
          };
          "capslayer" = {
            "a" = "left";
            "s" = "down";
            "d" = "up";
            "f" = "right";
          };
        };
      };
    };
  };

}
