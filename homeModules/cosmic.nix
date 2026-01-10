{ inputs, cosmicLib, ... }:
{
  imports = [
    inputs.cosmic-manager.homeManagerModules.cosmic-manager
  ];
  wayland.desktopManager.cosmic = {
    enable = true;
    appearance.theme.mode = "dark";

    panels = [
      {
        anchor = cosmicLib.cosmic.mkRON "enum" "Top";
        expand_to_edges = true;
        name = "Panel";
        size = cosmicLib.cosmic.mkRON "enum" "XS";
        output = cosmicLib.cosmic.mkRON "enum" "All";
        margin = 0;

        plugins_wings = cosmicLib.cosmic.mkRON "optional" (
          cosmicLib.cosmic.mkRON "tuple" [
            [
              "com.system76.CosmicAppletWorkspaces"
            ]
            [
              "com.system76.CosmicAppletStatusArea"
              "com.system76.CosmicAppletAudio"
              "io.github.cosmic_utils.cosmic-ext-applet-external-monitor-brightness"
              "com.system76.CosmicAppletNotifications"
              "com.system76.CosmicAppletNetwork"
              "com.system76.CosmicAppletPower"
            ]
          ]
        );
        plugins_center = cosmicLib.cosmic.mkRON "optional" [
          "cosmic-ext-time-tracker"
          "com.system76.CosmicAppletTime"
          "io.github.cosmic_utils.weather-applet"
        ];
      }
    ];
    compositor = {
      autotile = true;
      autotile_behavior = cosmicLib.cosmic.mkRON "enum" "PerWorkspace";
      workspaces = {
        workspace_layout = cosmicLib.cosmic.mkRON "enum" "Vertical";
        workspace_mode = cosmicLib.cosmic.mkRON "enum" "OutputBound";
      };
    };
    shortcuts = [
      {
        action = cosmicLib.cosmic.mkRON "enum" {
          value = [ "obsidian" ];
          variant = "Spawn";
        };
        description = cosmicLib.cosmic.mkRON "optional" "Open Obsidian";
        key = "Super+O";
      }
      {
        action = cosmicLib.cosmic.mkRON "enum" {
          value = [ "thunderbird" ];
          variant = "Spawn";
        };
        description = cosmicLib.cosmic.mkRON "optional" "Open mail client";
        key = "Super+E";
      }
      {
        action = cosmicLib.cosmic.mkRON "enum" "Fullscreen";
        key = "Super+F";
      }
      # {
      # action = cosmicLib.cosmic.mkRON "enum" "Suspend";
      # key = "Super+Esc";
      # }
    ];
  };

  programs.cosmic-files.settings = {
    favorites = [
      (cosmicLib.cosmic.mkRON "enum" "Home")
      (cosmicLib.cosmic.mkRON "enum" "Downloads")
      (cosmicLib.cosmic.mkRON "enum" "Documents")
      (cosmicLib.cosmic.mkRON "enum" "Pictures")
    ];
  };
}
