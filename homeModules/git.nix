{ ... }:
{
  programs = {
    git = {
      enable = true;
      userName = "hiimkobeand";
      userEmail = "hiimkobeand@gmail.com";
      aliases = {
        st = "status";
        aa = "add -A";
        cc = "!koji";
        ll = "log --oneline --decorate --graph";
        last = "log -1 HEAD";
        unstage = "reset HEAD --";
      };
    };
  };
}
