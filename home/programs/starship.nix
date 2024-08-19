{ 
inputs,
... 
}:
{
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    catppuccin.enable = true;
    
    };
}
