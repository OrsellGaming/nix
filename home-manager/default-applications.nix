{ ... }:
{
  xdg = {
    desktopEntries = {
      code = {
        name = "Visual Studio Code";
        genericName = "Code Editor";
        exec = "code %U";
        terminal = false;
        categories = [ "Application" ];
        mimeType = [ "text/html" "text/xml" ];
      };
      vlc = {
        name = "VLC";
        genericName = "VLC Media Player";
        exec = "vlc %U";
        terminal = false;
        categories = [ "Application" ];
        mimeType = [ "video/*" ];
      };

      # kitty = {
      #   name = "kitty";
      #   genericName = "Terminal emulator";
      #   exec = "kitty --start-as=fullscreen"; # this is the main fix and the rest is to conform with original
      #   icon = "kitty";
      #   comment = "Fast, feature-rich, GPU based terminal";
      #   categories = [ "System" "TerminalEmulator" ];
      #   settings = {
      #     TryExec = "kitty";
      #   };
      # };
    };

    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/plain" = ["code.desktop"];
        "image/*" = ["gimp.desktop"];
        "video/*" = ["vlc.desktop"];
      };
    };
  };
}
