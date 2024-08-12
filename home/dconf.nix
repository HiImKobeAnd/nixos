# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{lib, ...}:
with lib.hm.gvariant; {
  dconf.settings = {
    "org/gnome/Console" = {
      audible-bell = false;
      visual-bell = false;
    };

    "org/gnome/calendar" = {
      active-view = "month";
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = ["gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.Loupe.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop"];
      categories = ["X-GNOME-Utilities"];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/calendar" = {
      show-weekdate = true;
    };

    "org/gnome/desktop/datetime" = {
      automatic-timezone = false;
    };

    "org/gnome/desktop/interface" = {
      enable-hot-corners = "false";
      font-antialiasing = "grayscale";
      font-hinting = "slight";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
    };

    "org/gnome/desktop/privacy" = {
      disable-camera = true;
      old-files-age = mkUint32 30;
      recent-files-max-age = -1;
      remove-old-temp-files = true;
      remove-old-trash-files = true;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Ctrl>n";
      command = "firefox";
      name = "Open Browser";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super>t";
      command = "alacritty";
      name = "Open Terminal";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Super>g";
      command = "geary";
      name = "Open Mail Client";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      disabled-extensions = ["workspace-indicator@gnome-shell-extensions.gcampax.github.com" "material-shell@papyelgringo" "launch-new-instance@gnome-shell-extensions.gcampax.github.com" "apps-menu@gnome-shell-extensions.gcampax.github.com" "light-style@gnome-shell-extensions.gcampax.github.com" "native-window-placement@gnome-shell-extensions.gcampax.github.com" "places-menu@gnome-shell-extensions.gcampax.github.com" "system-monitor@gnome-shell-extensions.gcampax.github.com" "user-theme@gnome-shell-extensions.gcampax.github.com" "window-list@gnome-shell-extensions.gcampax.github.com" "windowsNavigator@gnome-shell-extensions.gcampax.github.com"];
      enabled-extensions = ["gsconnect@andyholmes.github.io" "paperwm@paperwm.github.com"];
      welcome-dialog-last-shown-version = "46.2";
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };

    "org/gnome/shell/extensions/auto-move-windows" = {
      application-list = ["youtube-music.desktop:1" "vesktop.desktop:1"];
    };

    "org/gnome/shell/extensions/paperwm" = {
      animation-time = 10;
      default-focus-mode = 2;
      disable-topbar-styling = true;
      edge-preview-enable = true;
      edge-preview-scale = 0.15;
      edge-preview-timeout-continual = false;
      gesture-enabled = false;
      horizontal-margin = 0;
      last-used-display-server = "Xorg";
      open-window-position = 0;
      overview-ensure-viewport-animation = 0;
      restore-attach-modal-dialogs = "false";
      restore-edge-tiling = "true";
      restore-keybinds = ''
        {"toggle-tiled-right":{"bind":"[\\"<Super>Right\\"]","schema_id":"org.gnome.mutter.keybindings"},"toggle-tiled-left":{"bind":"[\\"<Super>Left\\"]","schema_id":"org.gnome.mutter.keybindings"},"cancel-input-capture":{"bind":"[\\"<Super><Shift>Escape\\"]","schema_id":"org.gnome.mutter.keybindings"},"restore-shortcuts":{"bind":"[\\"<Super>Escape\\"]","schema_id":"org.gnome.mutter.wayland.keybindings"},"move-to-workspace-right":{"bind":"[\\"<Ctrl><Shift><Super>Right\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-panels":{"bind":"[\\"<Control><Alt>Tab\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-group-backward":{"bind":"[\\"<Shift><Super>Above_Tab\\",\\"<Shift><Alt>Above_Tab\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-to-workspace-1":{"bind":"[\\"<Super>Home\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"move-to-monitor-left":{"bind":"[\\"<Super><Shift>Left\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"unmaximize":{"bind":"[\\"<Super>Down\\",\\"<Alt>F5\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"move-to-monitor-down":{"bind":"[\\"<Super><Shift>Down\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-group":{"bind":"[\\"<Super>Above_Tab\\",\\"<Alt>Above_Tab\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-panels-backward":{"bind":"[\\"<Shift><Control><Alt>Tab\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-to-workspace-left":{"bind":"[\\"<Ctrl><Super>Left\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"move-to-workspace-up":{"bind":"[\\"<Control><Shift><Alt>Up\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"move-to-workspace-down":{"bind":"[\\"<Control><Shift><Alt>Down\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-to-workspace-right":{"bind":"[\\"<Ctrl><Super>Right\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-applications":{"bind":"[\\"<Super>Tab\\",\\"<Alt>Tab\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"move-to-monitor-right":{"bind":"[\\"<Super><Shift>Right\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-to-workspace-last":{"bind":"[\\"<Super>End\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"switch-applications-backward":{"bind":"[\\"<Shift><Super>Tab\\",\\"<Shift><Alt>Tab\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"move-to-workspace-left":{"bind":"[\\"<Ctrl><Shift><Super>Left\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"move-to-monitor-up":{"bind":"[\\"<Super><Shift>Up\\"]","schema_id":"org.gnome.desktop.wm.keybindings"},"shift-overview-up":{"bind":"[\\"<Super><Alt>Up\\"]","schema_id":"org.gnome.shell.keybindings"},"shift-overview-down":{"bind":"[\\"<Super><Alt>Down\\"]","schema_id":"org.gnome.shell.keybindings"},"focus-active-notification":{"bind":"[\\"<Super>n\\"]","schema_id":"org.gnome.shell.keybindings"},"rotate-video-lock-static":{"bind":"[\\"<Super>o\\",\\"XF86RotationLockToggle\\"]","schema_id":"org.gnome.settings-daemon.plugins.media-keys"},"close":{"bind":"[\\"<Alt>F4\\"]","schema_id":"org.gnome.desktop.wm.keybindings"}}
      '';
      restore-workspaces-only-on-primary = "false";
      selection-border-radius-top = 0;
      selection-border-size = 0;
      show-focus-mode-icon = false;
      show-open-position-icon = false;
      show-window-position-bar = true;
      show-workspace-indicator = false;
      vertical-margin = 0;
      vertical-margin-bottom = 0;
      window-gap = 0;
      winprops = [
        ''
          {"wm_class":"*","preferredWidth":"50%"}
        ''
      ];
    };

    "org/gnome/shell/extensions/paperwm/keybindings" = {
      barf-out = [""];
      barf-out-active = [""];
      center-horizontally = [""];
      close-window = ["<Super>q" "<Alt>F4"];
      cycle-height = [""];
      cycle-height-backwards = [""];
      cycle-width = ["<Super>r"];
      cycle-width-backwards = [""];
      live-alt-tab = ["<Alt>Tab"];
      live-alt-tab-backward = [""];
      live-alt-tab-scratch = [""];
      live-alt-tab-scratch-backward = [""];
      move-down = [""];
      move-down-workspace = ["<Shift><Control><Super>Down"];
      move-left = [""];
      move-monitor-above = [""];
      move-monitor-below = [""];
      move-monitor-left = [""];
      move-monitor-right = [""];
      move-previous-workspace = [""];
      move-previous-workspace-backward = [""];
      move-right = [""];
      move-space-monitor-above = [""];
      move-space-monitor-below = [""];
      move-space-monitor-left = [""];
      move-space-monitor-right = [""];
      move-up = [""];
      move-up-workspace = ["<Shift><Control><Super>Up"];
      new-window = [""];
      previous-workspace = [""];
      previous-workspace-backward = [""];
      resize-h-dec = [""];
      resize-h-inc = [""];
      resize-w-dec = [""];
      resize-w-inc = [""];
      slurp-in = [""];
      swap-monitor-above = [""];
      swap-monitor-below = [""];
      swap-monitor-left = [""];
      swap-monitor-right = [""];
      switch-down-or-else-workspace = ["<Control><Super>Down"];
      switch-down-workspace = [""];
      switch-first = ["<Super>comma"];
      switch-focus-mode = [""];
      switch-last = ["<Super>period"];
      switch-monitor-above = [""];
      switch-monitor-below = [""];
      switch-monitor-left = [""];
      switch-monitor-right = [""];
      switch-next = [""];
      switch-open-window-position = [""];
      switch-previous = [""];
      switch-up-or-else-workspace = ["<Control><Super>Up"];
      switch-up-workspace = [""];
      take-window = [""];
      toggle-maximize-width = ["<Super>m"];
      toggle-scratch = [""];
      toggle-scratch-layer = [""];
      toggle-scratch-window = [""];
      toggle-top-and-position-bar = [""];
    };

    "org/gnome/shell/extensions/paperwm/workspaces" = {
      list = ["21a2f849-36ec-4666-a0f4-936283c55fd9" "76c1b5a7-d1d6-49bb-a48d-314b8a9e7ce3" "9c281b3a-f114-4fbf-a110-62c3b872e4ae" "a18de627-2f83-4068-87ef-996a89575a32"];
    };

    "org/gnome/shell/extensions/paperwm/workspaces/21a2f849-36ec-4666-a0f4-936283c55fd9" = {
      index = 0;
      show-position-bar = true;
      show-top-bar = true;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/76c1b5a7-d1d6-49bb-a48d-314b8a9e7ce3" = {
      index = 1;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/9c281b3a-f114-4fbf-a110-62c3b872e4ae" = {
      index = 2;
    };

    "org/gnome/shell/extensions/paperwm/workspaces/a18de627-2f83-4068-87ef-996a89575a32" = {
      index = 3;
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = true;
      sort-column = "name";
      sort-directories-first = true;
      sort-order = "ascending";
      type-format = "category";
      view-type = "list";
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
    };

    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };

    "org/virt-manager/virt-manager/paths" = {
      image-default = "/home/hiimkobeand/Downloads";
    };

    "org/virt-manager/virt-manager/vmlist-fields" = {
      disk-usage = false;
      network-traffic = false;
    };
  };
}
