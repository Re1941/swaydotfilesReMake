function fish_prompt -d "Write out the prompt"
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive
    set fish_greeting

    alias ls 'eza --icons'
    alias q 'qs -c ii'
    alias ff fastfetch
    alias b btop
    # alias sudo doas
    alias cc 'doas pacman -Scc --noconfirm && paru -Sc --noconfirm'
    alias up 'doas pacman -Syu --noconfirm && paru -Syu --aur --noconfirm && cc'
    alias grep rg
    alias n nvim
    fastfetch
end
