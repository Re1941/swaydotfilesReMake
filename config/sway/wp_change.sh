#!/bin/bash

find ~/Pictures/wp -type f | fzf --preview "chafa --size=\$(tput cols)x\$(tput lines) --clear {}" \
--preview-window=up:70%:wrap | tee >(xargs swww img -t none) | xargs matugen -m "dark" -r lanczos3 -tscheme-content image 
 
