{ config, pkgs, ... }:

{
  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
  };

  # Enable networking
  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "mac";
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = true;
  services.pipewire.enable = false;
  security.rtkit.enable = true;
  #services.pipewire = {
  # enable = true;
  #  alsa.enable = true;
  #  alsa.support32Bit = true;
  #  pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  #};

  programs.virt-manager.enable = true;
  programs.gnome-disks.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # environment.sessionVariables.POWERDEVIL_NO_DDCUTIL = "1";

  # sudo ddcutil detect --verbose
  # sudo ddcutil getvcp known
  # sudo ddcutil setvcp 100 50 --display 1
  boot.extraModulePackages = with config.boot.kernelPackages; [ 
    broadcom_sta
    #ddcci-driver
  ];

  boot.kernelModules = [
    "i2c-dev"
    "ddcci_backlight"
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # GUI Things
    
    appimage-run
    geekbench
    kdePackages.kate
    bottles
    xorg.xhost
    notify-desktop
    ddcutil
    imsprog
    zed-editor
    
    #Browsers
  # google-chrome
  # brave
    firefox
    
    #Socials
    slack
    signal-desktop
    telegram-desktop
    
    #Programming
    vscode
    python314
    go
    hugo

    # Utils
    gparted
    obsidian
    
    # GPU Related Stuff
    furmark
    mesa-demos
    #displaylink
 
  ];

}
