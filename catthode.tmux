# Copyright (c) 2025-present Catthode
# This source code is licensed under the MIT license found in the license file.

CATTHODE_TMUX_COLOR_THEME_FILE=src/catthode.conf
CATTHODE_TMUX_VERSION=0.1.0
CATTHODE_TMUX_STATUS_CONTENT_FILE="src/catthode-status-content.conf"
CATTHODE_TMUX_STATUS_CONTENT_NO_PATCHED_FONT_FILE="src/catthode-status-content-no-patched-font.conf"
CATTHODE_TMUX_STATUS_CONTENT_OPTION="@catthode_tmux_show_status_content"
CATTHODE_TMUX_STATUS_CONTENT_DATE_FORMAT="@catthode_tmux_date_format"
CATTHODE_TMUX_NO_PATCHED_FONT_OPTION="@catthode_tmux_no_patched_font"
_current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

__cleanup() {
  unset -v CATTHODE_TMUX_COLOR_THEME_FILE CATTHODE_TMUX_VERSION
  unset -v CATTHODE_TMUX_STATUS_CONTENT_FILE CATTHODE_TMUX_STATUS_CONTENT_NO_PATCHED_FONT_FILE
  unset -v CATTHODE_TMUX_STATUS_CONTENT_OPTION CATTHODE_TMUX_NO_PATCHED_FONT_OPTION
  unset -v CATTHODE_TMUX_STATUS_CONTENT_DATE_FORMAT
  unset -v _current_dir
  unset -f __load __cleanup
  tmux set-environment -gu CATTHODE_TMUX_STATUS_TIME_FORMAT
  tmux set-environment -gu CATTHODE_TMUX_STATUS_DATE_FORMAT
}

__load() {
  tmux source-file "$_current_dir/$CATTHODE_TMUX_COLOR_THEME_FILE"

  local status_content=$(tmux show-option -gqv "$CATTHODE_TMUX_STATUS_CONTENT_OPTION")
  local no_patched_font=$(tmux show-option -gqv "$CATTHODE_TMUX_NO_PATCHED_FONT_OPTION")
  local date_format=$(tmux show-option -gqv "$CATTHODE_TMUX_STATUS_CONTENT_DATE_FORMAT")

  if [ "$(tmux show-option -gqv "clock-mode-style")" == '12' ]; then
    tmux set-environment -g CATTHODE_TMUX_STATUS_TIME_FORMAT "%I:%M %p"
  else
    tmux set-environment -g CATTHODE_TMUX_STATUS_TIME_FORMAT "%H:%M"
  fi

  if [ -z "$date_format" ]; then
    tmux set-environment -g CATTHODE_TMUX_STATUS_DATE_FORMAT "%Y-%m-%d"
  else
    tmux set-environment -g CATTHODE_TMUX_STATUS_DATE_FORMAT "$date_format"
  fi

  if [ "$status_content" != "0" ]; then
    if [ "$no_patched_font" != "1" ]; then
      tmux source-file "$_current_dir/$CATTHODE_TMUX_STATUS_CONTENT_FILE"
    else
      tmux source-file "$_current_dir/$CATTHODE_TMUX_STATUS_CONTENT_NO_PATCHED_FONT_FILE"
    fi
  fi
}

__load
__cleanup