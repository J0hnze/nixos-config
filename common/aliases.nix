{ config, pkgs, ... }:

{
  environment.shellAliases = {

# Make some possibly destructive commands more interactive.

    rm="rm -i";
    mv="mv -i";
    cp="cp -i";

    # GIT Stuff
    gstat="git status";
    glog="git log";
    _first-commit="git commit --allow-empty -m 'WIP: Initial Commit'";
    _get-keys="curl https://github.com/Johnze.keys >> ~/.ssh/authorized_keys";

    # Ruby Installer Stuff

    _rbenv-installer="curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash";
    _rbenv-doc="curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-doctor | bash";

    # Rails Stuff
    _Rup ="rails s -b 0.0.0.0";
    _Rdb-setup="rails db:setup";
    _Rdb-create="rails db:create";
    _Rdb-migrate="rails db:migrate";

    # Postgres
    _kpg="sudo service postgresql status && sudo service postgresql stop && sudo service postgresql status";
    _upg="sudo service postgresql start";

    # Security Stuff
    _user="echo '$(whoami)@$(hostname)'";
    mk-pass="openssl rand -base64 30";
    mk-ssh-key-ed25519="ssh-keygen -t ed25519 -C `_user`";
    mk-ssh-key-rsa="ssh-keygen -t rsa -b 4096 -C `_user`";

    #Misc
    apt="sudo apt";
    df="df -h";

    # GREP
    egrep="egrep --color=auto";
    fgrep="fgrep --color=auto";
    gh="history | grep";
    grep="grep --color=auto";

    # LS
    la="ls -A";
    ll="ls -latr";
    ls="ls --color=auto";
    myip="curl ipinfo.io/ip";
    
    # Nix
    _ns = "sudo nixos-rebuild switch";
    _nr = "sudo nixos-rebuild boot";
    _nc = "nix-collect-garbage -d";

    # Networking
    ip = "ip -c a";
    ports = "sudo lsof -i -P -n | grep LISTEN";

    # Custom
    rebuild = "sudo nixos-rebuild switch --flake .#$(hostname)";
    editcfg = "nvim /etc/nixos/configuration.nix";
  };
}