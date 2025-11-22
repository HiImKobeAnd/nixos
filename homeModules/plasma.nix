{ inputs, ... }:
{
  imports = [
    inputs.plasma-manager.homeModules.plasma-manager
  ];
  programs.plasma = {
    enable = true;

    panels = [
      {
        location = "top";
        widgets = [
          {
            digitalClock = {
              calendar.firstDayOfWeek = "monday";
              time.format = "24h";
            };
          }
          {
            systemTray.items = {
              shown = [
                "org.kde.plasma."
              ];
              hidden = [
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.volume"
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.clipboard"
              ];
            };
          }
        ];
      }
    ];
  };
}
