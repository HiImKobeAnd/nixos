{...}: {
  xdg.desktopEntries = {
    windows = {
      name = "windows 11";
      genericName = "Virtual machine";
      exec = "quickemu --vm /home/hiimkobeand/VM/quickemu/windows-11.conf --display spice";
      terminal = false;
      categories = ["Utility"];
    };
  };

  programs = {
    zathura = {
      enable = true;
      options = {
        continuous-hist-save = "true";
        database = "sqlite";
      };
    };

    sioyek = {
      enable = true;
      config = {
        "shared_database_path" = "/home/hiimkobeand/sioyek";
      };
    };
  };
}