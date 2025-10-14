{ ... }:

{
    home.file.".gitconfig".source = ../dotfiles/git/.gitconfig;

    programs.git = {
        enable = true;
        userName = "ketzelmania";
        userEmail = "gcpetitt@proton.me";

        extraConfig.init.defaultBranch = "main";

        aliases = {
            lg = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all";
            lg2 = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n'' %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'";
        };
    };
}
