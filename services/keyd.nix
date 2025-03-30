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
            "capslock" = "layer(navlayer)";
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
          "navlayer" = {
            "a" = "left";
            "d" = "right";
            "w" = "up";
            "s" = "down";
          };
        };
      };
    };
  };

}
