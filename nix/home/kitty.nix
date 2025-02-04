{ config, pkgs, ... }:

let
  dracula-colors = {
    "foreground" = "#f8f8f2";
    "background" = "#282a36";
    "selection_foreground" = "#ffffff";
    "selection_background" = "#44475a";

    "url_color" = "#8be9fd";

    # black
    "color0" = "#21222c";
    "color8" = "#6272a4";

    # red
    "color1" = "#ff5555";
    "color9" = "#ff6e6e";

    # green
    "color2" = "#50fa7b";
    "color10" = "#69ff94";

    # yellow
    "color3" = "#f1fa8c";
    "color11" = "#ffffa5";

    # blue
    "color4" = "#bd93f9";
    "color12" = "#d6acff";

    # magenta
    "color5" = "#ff79c6";
    "color13" = "#ff92df";

    # cyan
    "color6" = "#8be9fd";
    "color14" = "#a4ffff";

    # white
    "color7" = "#f8f8f2";
    "color15" = "#ffffff";

    # Cursor colors
    "cursor" = "#f8f8f2";
    "cursor_text_color" = "background";

    # Tab bar colors
    "active_tab_foreground" = "#282a36";
    "active_tab_background" = "#f8f8f2";
    "inactive_tab_foreground" = "#282a36";
    "inactive_tab_background" = "#6272a4";

    # Marks
    "mark1_foreground" = "#282a36";
    "mark1_background" = "#ff5555";
  };
in
{
  programs.kitty = {
    enable = true;

    font.name = "FiraCode Nerd Font";

    settings = {
      term = "xterm-256color";
      scrollback_lines = 10000;
      # background_opacity = "0.98";
      # hide_window_decorations = "titlebar-only";
      tab_bar_style = "separator";
      tab_bar_edge = "top";

      font_size = 14;
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      enabled_layouts = "splits, stack";

      strip_trailing_spaces = "smart";

      enable_audio_bell = true;

      macos_option_as_alt = true;
      macos_quit_when_last_window_closed = true;
      macos_show_window_title_in = "window";

      allow_hyperlinks = true;
      copy_on_select = true;
    } // dracula-colors;

    # Neovim
    extraConfig = ''
      modify_font underline_position 6
      modify_font underline_thickness 250%
    '';

    keybindings = {
      # Copy Paste
      "ctrl+c" = "copy_and_clear_or_interrupt";
      "ctrl+shift+v" = "paste_from_clipboard";

      # Fzf
      ## Scrollback search
      "ctrl+shift+f" = "launch --allow-remote-control kitty +kitten kitty-kitten-search/search.py @active-kitty-window-id";

      # Split conf
      "ctrl+shift+enter" = "launch --location=hsplit --cwd=current";
      "ctrl+enter" = "launch --location=vsplit --cwd=current";

      # Window management
      "ctrl+left" = "neighboring_window left";
      "ctrl+up" = "neighboring_window up";
      "ctrl+down" = "neighboring_window down";
      "ctrl+right" = "neighboring_window right";
      "shift+left" = "move_window right";
      "shift+up" = "move_window down";
      "shift+down" = "move_window up";
      "shift+right" = "move_window left";
      "ctrl+shift+z" = "toggle_layout stack";
      "f1" = "create_marker";
      "f2" = "remove_marker";
      "f3" = "launch --allow-remote-control kitty +kitten broadcast --match-tab state:focused";
    };
  };
}
