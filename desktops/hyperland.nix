{ config, pkgs, ... }:
{
  programs.hyprland.enable = true;

  # Use a display manager; GDM works well with Wayland
  services.xserver.enable = true;         # for Xwayland
  services.xserver.displayManager.gdm.enable = true;



  # Audio
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  security.rtkit.enable = true;

  # Handy Wayland tools
  environment.systemPackages = with pkgs; [
    waybar wofi grim slurp wl-clipboard mako
  ];
}
