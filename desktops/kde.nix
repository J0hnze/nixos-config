{ config, pkgs, ... }:
{
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # X keyboard (matches what you had)
  services.xserver.enable = true;        # Xwayland too
  services.xserver.xkb = {
    layout = "gb";
    variant = "mac";
  };

  # Audio: PipeWire recommended
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  security.rtkit.enable = true;
}
