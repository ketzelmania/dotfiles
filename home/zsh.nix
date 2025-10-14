{ pkgs, ... }:

{
  home.file.".p10k.zsh".source = ../dotfiles/p10k/.p10k.zsh;
  xdg.configFile."fastfetch/config.jsonc".source = ../dotfiles/fastfetch/config.jsonc;

  programs.fastfetch = {
      enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    initContent = ''
    if [[ -o interactive ]]; then
        fastfetch
    fi

    source ~/.p10k.zsh
    '';

    plugins = [
      {
	name = "powerlevel10k";
	src = pkgs.zsh-powerlevel10k;
	file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    historySubstringSearch.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "dirhistory"
        "colored-man-pages"
        "copybuffer"
      ];
    };

    shellAliases = {
      ls = "lsd -al --color=always --group-directories-first";
      la = "lsd -a --color=always --group-directories-first";
      ll = "lsd -l --color=always --group-directories-first";
      ld = "lsd -ald --color=always --group-directories-first .*";
      lt = "lsd --tree";

      dir = "lsd --color=always --group-directories-first";

      fzf = "fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'";
      cat = "bat --style=numbers";

      getip = "ip -br -c a";

      nixup = "sudo nixos-rebuild switch --flake /home/met/.config/nix#nixos";
    };
  };
}
