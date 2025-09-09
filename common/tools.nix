{config, pkgs, ...}:

{
environment.systemPackages = with pkgs; [
  binwalk
  bloodhound
  burpsuite
  hashcat
  hashcat-utils
  feroxbuster
  gowitness
  ghidra
  netexec
  nmap
  openvpn
  rustup
  seclists
  ];
}