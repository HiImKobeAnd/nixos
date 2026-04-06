_: {
  xdg.desktopEntries = {
    windows = {
      name = "Windows 11";
      genericName = "Virtual machine";
      exec = "quickemu --vm /home/hiimkobeand/VM/quickemu/windows-11.conf --display spice";
      terminal = false;
      categories = [ "Utility" ];
    };
  };
}
