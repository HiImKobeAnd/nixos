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
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    zathura = {
      enable = true;
      options = {
        continuous-hist-save = "true";
        database = "sqlite";
      };
    };
  };
}
