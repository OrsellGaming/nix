{ lib, pkgs, ...}:
{
  programs.git = {
    enable = true;
    userName  = "OrsellGaming";
    userEmail = "34631691+OrsellGaming@users.noreply.github.com";
    lfs.enable = true;
    extraConfig = {
      # Sign all commits using ssh key
      commit.gpgsign = true;
      gpg.format = "ssh";
      "gpg \"ssh\"".program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHISguK84EGMZZpL/Iz6Ug9AEP4BpSw3xIbamAmHgr/l";
    };
  };
}
