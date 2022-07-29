{ config, pkgs, ... }:
let
  dotfiles_path = "/home/hannes/.dotfiles";
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "hannes";
  home.homeDirectory = "/home/hannes";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  home.file = {
    ".config/" = {
      source = "${dotfiles_path}/dotfiles/config";
      recursive = true;
    };
    ".zsh/" = {
      source = "${dotfiles_path}/dotfiles/zsh";
      recursive = true;
    };
    ".gitconfig".source = "${dotfiles_path}/dotfiles/gitconfig";
    ".tmux.conf".source = "${dotfiles_path}/dotfiles/tmux.conf";
    ".zsh_prompt".source = "${dotfiles_path}/dotfiles/zsh_prompt";
    ".zshrc".source = "${dotfiles_path}/dotfiles/zshrc";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
