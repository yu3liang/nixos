{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Let Home-manager install and manage itself
  programs.home-manager.enable = true;

  # Program configurations
  programs = {

    git = {
      enable = true;
      userName = "yu3liang";
      userEmail = "gustavo.lampert@gmail.com";
      extraConfig = {
        credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
      };
    };

    ags = {
      enable = true;
      # configDir = ./home-dotfiles-desktop/ags;
      extraPackages = [ pkgs.libsoup_3 ];
    };

    vscode = {
      enable = true;
    };
  };
}
