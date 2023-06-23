{ config, ...}: {

    # Shell
    programs.fish.enable = true;
    users.defaultUserShell = pkgs.fish;
    environment.shells = with pkgs; [ fish ];
    #programs.fish.shellAliases = {
    #        # replace ls with exa
    #        ls = "exa";
    #        lsa = "exa -lahG";
    #        tree = "exa -T";
    #        # replace cat with bat
    #        cat = "bat";
    #        # replace (h)top with btop
    #        top = "btop";
    #        htop = "btop";
    #};
}
