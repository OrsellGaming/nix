{ config, pkgs, inputs, ... }:

{
  home.username = "n";
  home.homeDirectory = "/home/n";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    fastfetch
    lutris
    gale
    qbittorrent
    vlc
  ];

  programs.bash.enable = true;

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

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      yzhang.markdown-all-in-one
      bbenoist.nix
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
	    {
	      name = "vscript-snippets";
	      publisher = "Baptiste-Martinet";
	      version = "1.0.4";
	      sha256 = "jZ/h9nXaCz8cHcKKKFW6aevx6QdftfqBXungQ3CjwhU=";
	    }
	    {
	      name = "vscript-debug";
	      publisher = "LionDoge";
	      version = "0.2.7";
	      sha256 = "CXmSRIK+00bN0ONLuLeIgIMYeM3tqBJ7R6JhveIhv00=";
	    }
	    {
	      name = "vscode-electricimp";
	      publisher = "electricimp";
	      version = "1.0.0";
	      sha256 = "a23AfdrJTCQYj7vJCDYwdxe7MvoTfH8bGVjB92ktp7w=";
	    }
    ];
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
    ];
  };

  programs.firefox = {
    enable = true;
    profiles.n = {
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
      ];
    };
  };

  programs.nixcord = {
    enable = true;  # enable Nixcord. Also installs discord package
    vesktop.enable = false;
    config = {
      themeLinks = [
        "https://raw.githubusercontent.com/Xhylo/Visual-Studio-Code-BD-theme/main/VSC-Cord.theme.css"
      ];
      plugins = {
        betterGifPicker.enable = true;
        betterSessions.enable = true;
        callTimer.enable = true;
        clearURLs.enable = true;
        dearrow.enable = true;
        disableCallIdle.enable = true;
        experiments.enable = true;
        fakeNitro.enable = true;
        fakeProfileThemes.enable = true;
        fixCodeblockGap.enable = true;
        fixImagesQuality.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        forceOwnerCrown.enable = true;
        friendInvites.enable = true;
        friendsSince.enable = true;
        gameActivityToggle.enable = true;
        gifPaste.enable = true;
        greetStickerPicker.enable = true;
        hideAttachments.enable = true;
        imageLink.enable = true;
        implicitRelationships.enable = true;
        memberCount.enable = true;
        mentionAvatars.enable = true;
        messageLinkEmbeds.enable = true;
        messageLogger.enable = true;
        moreCommands.enable = true;
        messageTags.enable = true;
        moreUserTags.enable = true;
        mutualGroupDMs.enable = true;
        noOnboardingDelay.enable = true;
        noReplyMention.enable = true;
        noUnblockToJump.enable = true;
        normalizeMessageLinks.enable = true;
        onePingPerDM.enable = true;
        pauseInvitesForever.enable = true;
        permissionFreeWill.enable = true;
        permissionsViewer.enable = true;
        pictureInPicture.enable = true;
        pinDMs.enable = true;
        platformIndicators.enable = true;
        previewMessage.enable = true;
        pronounDB.enable = true;
        relationshipNotifier.enable = true;
        revealAllSpoilers.enable = true;
        serverInfo.enable = true;
        serverListIndicators.enable = true;
        shikiCodeblocks.enable = true;
        showAllMessageButtons.enable = true;
        showConnections.enable = true;
        showHiddenChannels.enable = true;
        showHiddenThings.enable = true;
        showMeYourName.enable = true;
        showTimeoutDuration.enable = true;
        silentMessageToggle.enable = true;
        spotifyCrack.enable = true;
        stickerPaste.enable = true;
        translate.enable = true;
        typingIndicator.enable = true;
        typingTweaks.enable = true;
        unindent.enable = true;
        unsuppressEmbeds.enable = true;
        userVoiceShow.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        vcNarrator.enable = true;
        viewIcons.enable = true;
        voiceDownload.enable = true;
        volumeBooster.enable = true;
        whoReacted.enable = true;
        youtubeAdblock.enable = true;
        webRichPresence.enable = true;
        webScreenShareFixes.enable = true;

        openInApp = {
          enable = true;
          steam = true;
          spotify = false;
          epic = false;
          tidal = false;
          itunes = false;
        };
        
        noPendingCount =  {
          enable = true;
          hideFriendRequestsCount = false;
          hideMessageRequestCount = false;
        };
      };
    };
  };

  services.arrpc.enable = true;

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";



  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
