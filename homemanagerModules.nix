{
  default = { };
  autorandr = import ./homemanager/autorandr/desktop.nix;
  bspwm = import ./homemanager/bspwm/bspwm.nix;
  dunst = import ./homemanager/dunst/dunst.nix;
  firefox = import ./homemanager/firefox.nix;
  git = import ./homemanager/git.nix;
  kitty = import ./homemanager/kitty.nix;
  newsboat = import ./homemanager/newsboat.nix;
  polybar = import ./homemanager/polybar/polybar.nix;
  xmonad = import ./homemanager/xmonad;
  zellij = import ./homemanager/zellij.nix;
  zsh = import ./homemanager/zsh.nix;
}
