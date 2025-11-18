{ config, pkgs, ... }:

{
  home.username = "markov";
  home.homeDirectory = "/home/markov";
  home.stateVersion = "25.05";
#github token classic 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
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos";
      ll = "eza -al";
      nrs = "sudo nixos-rebuild switch";
    };

    initExtra = ''
      export PS1='\[\e[38;5;40m\]\u\[\e[0m\] in \[\e[38;5;33m\]\w\[\e[0m\] \\$ '
      '';
  };
  
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.9;
      font.normal = {
        family = "JetBrains Mono";
	style = "Regular";
      };
      font.size = 16;
    };
  };

  programs.eza = {
    enable = true;
    icons = "auto"; # Options: true, "auto", "always"
  };

  home.file.".config/bat/config".text = ''
  --theme="Nord"
  --style="numbers,changes,grid"
  --paging=auto
  '';
  
  home.packages = with pkgs; [
    bat
    eza
  ];

}
