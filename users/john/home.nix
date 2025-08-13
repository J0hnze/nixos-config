{ pkgs, ... }:
{
  home.stateVersion = "24.11";

  programs.git = {
    enable = true;
    userName = "J0hnze";
    userEmail = "ponix@protonmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.plasma = {
    enable = true;

    kscreenlocker = {
      autoLock = false;
    };

    powerdevil = {
      AC = {
        powerButtonAction = "shutDown";
        autoSuspend = {
          action = "nothing";
        };
        # turnOffDisplay = {
        #   idleTimeout = "never";
        # };
        # dimDisplay = {
        #   idleTimeout = null;
        # };
        displayBrightness = 100;
        powerProfile = "performance";
      };
    };

    session = {
      general = {
        askForConfirmationOnLogout = false;
      };
      sessionRestore = {
        restoreOpenApplicationsOnLogin = "startWithEmptySession";
      };
    };

    configFile = {
      baloofilerc."Basic Settings"."Indexing-Enabled" = false;
    };
  };
}
