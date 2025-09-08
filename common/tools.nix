{config, ...}:

{
environment.systemPackages = with pkgs; [
  nmap
  burpsuite
  
  ];
}