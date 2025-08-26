{ ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = false;
    extraConfig = ''
      set -g status-right "#[fg=orange,bg=black]%A, %d %b %Y %I:%M %p"
      set -g mouse on
    '';
  };
}
