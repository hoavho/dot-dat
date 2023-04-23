#!/bin/sh

# Main mono font
paru -S adobe-source-code-pro-fonts

# To display emoji + unicodes
paru -S noto-fonts-emoji
paru -S noto-fonts-cjk
paru -S ttf-joypixels
paru -S otf-font-awesome-5

# Font dejavu is needed to render "Spiral Calendar" emoji correctly
# Noto font or Joypixels is NOT enough.
# Without dejavu font, we'd see crossed rectangle symbol
paru -S ttf-dejavu

# Indic Opentype Fonts -> Pages about Unicodes in Rust lang documentation use this font in their examples.
# => I install this font just to render those pages properly
paru -S ttf-indic-otf

# Remember to restart dwm after installing to reload fonts
