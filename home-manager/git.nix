{...}:
{
  programs.git = {
    enable = true;
    userName  = "BackSlashN";
    userEmail = "thewoodster333@gmail.com";
    extraConfig = {
      # Sign all commits using ssh key
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/github.pub";
    };
  };
}
