{ stable, ... }:

{ 
 imports = [ ./configuration/default.nix ];

 programs.zsh.enable    = true;
 users.defaultUserShell = with stable; zsh;
 environment.shells     = with stable; [ zsh ];
}
