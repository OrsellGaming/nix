{...}:
{
  programs.git = {
    enable = true;
    userName  = "OrsellGaming";
    userEmail = "34631691+OrsellGaming@users.noreply.github.com";
    lfs.enable = true;
    extraConfig = {
      # Sign all commits using ssh key
      #commit.gpgsign = true;
      #gpg.format = "ssh";
      #user.signingkey = "~/.ssh/github.pub";
    };
  };
}
