function fish_prompt -d "Write out the prompt"
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end
if test -f ~/.config/fish/colors.fish
    source ~/.config/fish/colors.fish
end
if status is-interactive # Commands to run in interactive sessions can go here

    set fish_greeting

    alias ls 'eza --icons' 
    alias ff fastfetch
    alias b btop
    alias cc 'doas pacman -Scc --noconfirm && yay -Scc --noconfirm'
    alias up 'doas pacman -Syu --noconfirm && yay -Sua --noconfirm'
    alias n nvim
    fastfetch
end
