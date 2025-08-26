# FILE MANAGER
{ pkgs, ... }:
{
  home.packages = with pkgs; [ nemo-with-extensions ];
  dconf = {
    settings = {
      "org/cinnamon/desktop/applications/terminal" = {
        exec = "kitty";
      };
    };
  };
}
