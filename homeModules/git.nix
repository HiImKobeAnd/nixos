_: {
  programs = {
    git = {
      enable = true;
      settings = {
        user.email = "hiimkobeand@gmail.com";
        user.name = "hiimkobeand";
        alias = {
          st = "status";
          aa = "add -A";
          cc = "!koji";
          ll = "log --oneline --decorate --graph";
          last = "log -1 HEAD";
          unstage = "reset HEAD --";
        };
      };
    };
    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
    delta = {
      enable = true;
      enableGitIntegration = true;
    };
  };
}
