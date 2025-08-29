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

  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # DDC/CI
  boot.extraModulePackages = [ config.boot.kernelPackages.ddcci-driver ];
  boot.kernelModules = [ "i2c-dev" "ddcci_backlight" ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    appimage-run
    geekbench
    bottles
    xorg.xhost
    notify-desktop
    ddcutil
    imsprog
    zed-editor
    firefox
    slack
    signal-desktop
    telegram-desktop
    vscode
    python314
    go
    hugo
    obsidian
    furmark
    mesa-demos
  ];
}
