let
 systems = [ vonixos ];
 vonixos = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJGyMkUMi7ClNq0+PxY/Y9FoeGw9U4rkM+fBMkCqePUX";
in {
 "network.age".publicKeys = [ vonixos ];
}
