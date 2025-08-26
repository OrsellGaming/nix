{...}:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      display = {
        separator = "  ";
        "constants" = [
          "─────────────────" # {$1}; used in Custom module
        ];
        key = {
          type = "icon";
          paddingLeft = 2;
        };
      };
      modules = [
        {
          type = "custom"; # HardwareStart
          # {#1} is equivalent to `\u001b[1m`. {#} is equivalent to `\u001b[m`
          format = "┌{$1} {#1}Hardware Information{#} {$1}┐";
        }
        "host"
        "cpu"
        "gpu"
        "disk"
        "memory"
        "swap"
        "display"
        "brightness"
        "battery"
        "poweradapter"
        "bluetooth"
        "sound"
        "gamepad"
        {
          type = "custom"; # SoftwareStart
          format = "├{$1} {#1}Software Information{#} {$1}┤";
        }
        {
          type = "title";
          keyIcon = "";
          key = "Title"; # Title module has no key by default; so that icon is not displayed
          format = "{user-name}@{host-name}";
        }
        "os"
        "kernel"
        "lm"
        "de"
        "wm"
        "shell"
        "terminal"
        "terminalfont"
        "theme"
        "icons"
        "wallpaper"
        "packages"
        "uptime"
        "media"
        {
          type = "localip";
          compact = true;
        }
        "locale"
        {
          type = "custom"; # InformationEnd
          format = "└{$1}──────────────────────{$1}┘";
        }
        {
          type = "colors";
          paddingLeft = 2;
          symbol = "circle";
        }
      ];
    };
  };
}
