{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    autocd = true;
    historySubstringSearch.enable = true;
    history = {
      # enable = true;
      ignoreAllDups = true;
    };
    syntaxHighlighting.enable = true;
    initExtra = ''
    autoload -Uz compinit && compinit
    bindkey '^[[1;5C' emacs-forward-word
    bindkey '^[[1;5D' emacs-backward-word
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
    zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
    '';
  };

  home.shellAliases = {
    a = "helixx";
    q = "exit";

    cat = "bat --theme base16";
    bat = "bat --theme base16";
    ga = "git add -A";
    g = "git";

    ls = "eza --icons";
    l = "eza --icons -la";
    la = "eza --icons -a";
    ll = "eza --icons -l";
    tree = "eza --icons --tree -a";


    rm = "trash";
    bs = "brew services";

    fzf-bat = "fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'";

    sw = "cd ~/Documents/nix-mac ; gum spin --spinner line  --spinner.foreground 12 --title='switching to configuration...' --show-error make deploy && echo 'success' ; cd - >> /dev/null";
    sws = "cd ~/Documents/nix-mac ; gum spin --spinner line  --spinner.foreground 12 --title='switching to configuration...' --show-error make deploy && echo 'success' ; cd - >> /dev/null ; bs restart sketchybar >> /dev/null ; killall yabai ; killall skhd";
  };
}
