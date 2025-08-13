{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.john = {
    uid = 1000;
    isNormalUser = true;
    description = "John W";
    extraGroups = [
      "networkmanager"
      "wheel"
      "dialout"
      "i2c"
      "video"
    ];
    packages = with pkgs; [ ];
    openssh.authorizedKeys.keys = [
      
    ];
  };

  # Enable automatic login for the user.
  # services.displayManager.autoLogin.enable = true;
  # services.displayManager.autoLogin.user = "john";

  users.groups.libvirtd.members = [ "john" ];

  system.activationScripts.homeDir = ''
    usermod -u 1000 john
    chown -R 1000 /home/john
  '';

  # Allow launching of remote X11 apps on this display
  system.activationScripts.xhostConfig = ''
    mkdir -p /home/john/.config/autostart
    echo "#!/usr/bin/env bash"                >   /home/john/xhost-config.sh
    echo "${pkgs.xorg.xhost}/bin/xhost +"     >>  /home/john/xhost-config.sh
    chmod +x                                      /home/john/xhost-config.sh
    chown john:users                            /home/john/xhost-config.sh

    echo "[Desktop Entry]"                    >   /home/john/.config/autostart/xhost-config.sh.desktop
    echo "Exec=/home/john/xhost-config.sh"  >>  /home/john/.config/autostart/xhost-config.sh.desktop
    echo "Icon=application-x-shellscript"     >>  /home/john/.config/autostart/xhost-config.sh.desktop
    echo "Name=xhost-config.sh"               >>  /home/john/.config/autostart/xhost-config.sh.desktop
    echo "Type=Application"                   >>  /home/john/.config/autostart/xhost-config.sh.desktop
    echo "X-KDE-AutostartScript=true"         >>  /home/john/.config/autostart/xhost-config.sh.desktop

    chmod 600                                     /home/john/.config/autostart/xhost-config.sh.desktop
    chown -R john:users                         /home/john/.config/autostart
  '';
}
