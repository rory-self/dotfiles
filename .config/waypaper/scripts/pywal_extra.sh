#!/bin/bash
# Script used to update system configuration to use new pywal16 colours automatically, when
# the desktop wallpaper is updated

COLOURS_FILE="$HOME/.cache/wal/colors"
TMUX_CONF_DIRECTORY="$HOME/.config/tmux"
TMUX_COLOUR_CONF="$TMUX_CONF_DIRECTORY/colours.conf"

# Save new colours to tmux configuration directory
if [[ ! -e "$TMUX_CONF_DIRECTORY" ]]; then
  mkdir "$TMUX_CONF_DIRECTORY"
  echo "Created $TMUX_CONF_DIRECTORY directory."
fi

if [ -f "$COLOURS_FILE" ]; then
	index=0
	while IFS= read -r line; do
		eval "color$index=$line"
		((index++))
	done < "$COLOURS_FILE"

	for ((i=0; i<index; i++)); do
  	eval "echo color$i=\${color$i}"
	done

  if [[ -f "TMUX_COLOUR_CONF" ]]; then
    rm "$TMUX_COLOUR_CONF"
  fi

	cat > "$TMUX_COLOUR_CONF" << EOF
set -g @status-style-string "fg=${color4},bg=${color0}"
set -g @window-status-style-string "fg=${color0},bg=${color4}"

EOF

	tmux source "$TMUX_CONF_DIRECTORY/tmux.conf"
else
  echo "ERROR: Could not find pywal16 colour file at $COLOURS_FILE."
fi

