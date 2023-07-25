# Default: 0.4 second (man zshzle)
# The time the shell waits, in hundredths of seconds, for another key to be pressed when reading bound multi-character sequences (man zshparam)
# This param is used for switching between viins and vicmd keymap
# 15 = long enough for key "vv" work
KEYTIMEOUT=15

# controls whether the prompt is redrawn when switching to a different input mode
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

# controls whether the cursor style is changed when switching to a different input mode
VI_MODE_SET_CURSOR=true

VI_MODE_CURSOR_NORMAL=2
VI_MODE_CURSOR_VISUAL=6
VI_MODE_CURSOR_INSERT=4
VI_MODE_CURSOR_OPPEND=0
