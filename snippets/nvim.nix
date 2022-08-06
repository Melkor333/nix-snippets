{
  config,
  lib,
  pkgs,
}:
#|| snip
{
  environment.systemPackages = with pkgs; [
    (
      neovim.override {
        vimAlias = true;
        viAlias = true;
        configure = {
          packages.myPlugins = with pkgs.vimPlugins; {
            start = [vim-nix];
            opt = [];
          };
          customRC = ''
              " your custom vimrc
              set nocompatible
              set backspace=indent,eol,start
              set modeline
            '';
        };
      }
    )
  ];
}
