#!/bin/bash

COLOURS_FILE="~/.cache/wal/colors"
TMUX_CONF="~/.config/tmux/tmux.conf"

if [ -f "$COLOURS_FILE" ]; then
	index=0
	while IFS= read -r line; do
		eval "color$index=$line"
		((index++))
	done < "$COLOURS_FILE"

	for ((i=0; i<index; i++)); do
  	eval "echo color$i=\${color$i}"
	done

	rm "$TMUX_CONF"

	cat > "$TMUX_CONF" << EOF
set -g status-style fg=${color4},bg=${color0}

set -g window-status-current-style fg=${color0},bg=${color4}
EOF

	tmux source "$TMUX_CONF"

else
	eval "echo \"Could not find colors file\""
fi

