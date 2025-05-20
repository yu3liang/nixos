{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  nixpkgs.config.allowUnfree = true;

  # Let Home-manager install and manage itself
  programs.home-manager.enable = true;

  programs = {

    steam = {
      enable = true;

      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    ags = {
      enable = true;
      # configDir = ./home-dotfiles-desktop/ags;
      extraPackages = [ pkgs.libsoup_3 ];
    };

    kitty = {
      enable = true;
      # extraConfig = builtins.readFile ./home-dotfiles-desktop/kitty/kitty.conf;
    };

    vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        jnoortheen.nix-ide
        piousdeer.adwaita-theme
        pkief.material-product-icons
        #asvetliakov.vscode-neovim
      ];
      userSettings = { };
    };

    git = {
      enable = true;
      userName = "yu3liang";
      userEmail = "gusatvo.lampert@gmail.com";
      extraConfig = {
        credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
      };
    };
  };

  # Packages that should be installed to the user profile.
  home.packages = [
    pkgs.htop
  ];
}
