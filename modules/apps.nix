{ pkgs, ...}: {

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    home-manager

    vscode
    kitty

    yabai
    skhd
    sketchybar-app-font
    # gowall
    gum

    btop
    bat
    eza
    jq
    ripgrep
    wget
    fastfetch
    starship
    gh
    flameshot

    helix
    #nil
    #nixpkgs-fmt
    #pyright
    #python3.11.python-lsp-server
    ##unstable.bash-language-server
    #gopls
    ##unstable.typescript-language-server
    #typst-lsp
    #vscode-langservers-extracted
    #marksman

    python3
    go
    rustup

    obsidian

    jq
    pwgen


  ];

  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      # cleanup = "zap";
    };

    taps = [
      "homebrew/services"
      "PlayCover/playcover"
      "FelixKratz/formulae"
      "mrkai77/cask"
      "socsieng/tap"
    ];

    # `brew install`
    brews = [
      "nowplaying-cli"
      "switchaudio-osx"
      "sketchybar"
      "lua"
      "brightness"
      "macos-trash"
      "sendkeys"
      "dprint"
    ];

    # `brew install --cask`
    casks = [
      "playcover-community"
      "betterdisplay"
      "eloston-chromium"
      "linearmouse"
      "jordanbaird-ice"
      "loop"
      "motrix"
      "alt-tab"
      "shottr"
      "sf-symbols"
      "font-sf-mono"
      "font-sf-pro"
      "flameshot"
      "1password-cli"
      "font-jetbrains-mono-nerd-font"
      "signal"
    ];
  };
}
