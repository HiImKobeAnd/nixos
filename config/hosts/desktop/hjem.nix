{inputs, ...}: {
  flake.hjemModules.desktop = {...}: {
    imports = [
      inputs.hjem.nixosModules.default
    ];
    hjem.users.hiimkobeand = {
      user = "hiimkobeand";
      directory = "/home/hiimkobeand";
      xdg.config.files = {
        # "hypr".source = ../../../extra/hyprland;

        "git/config".clobber = true;
        "git/config".text = ''
          [user]
            name = "hiimkobeand"
            email = "hiimkobeand@gmail.com"

          [alias]
            st = status;
            aa = add -A;
            ca = commit --amend
            pf = push force-with-lease
            ll = log --oneline --decorate --graph;
            last = log -1 HEAD;
            unstage = reset HEAD --;

          [core]
            pager = delta

          [interactive]
            diffFilter = delta --color-only

          [delta]
            navigate = true

          [merge]
            conflictStyle = zdiff3
        '';

        "alacritty/alacritty.toml".clobber = true;
        "alacritty/alacritty.toml".text = ''
          [terminal]
          shell="fish"
          [general]
          import = ["~/.config/alacritty/themes/noctalia.toml"]
        '';
      };
    };
  };
}
