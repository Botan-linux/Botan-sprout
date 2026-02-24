if status is-interactive
    # Karşılama mesajı
    set -g fish_greeting ""
    echo "🌱 Botan Linux Sprout v1.0'a hoş geldiniz!"
    echo "Gelecek Botan ile büyüyecek..."

    # Renkli ve modern bir prompt için (Starship yüklü değilse basit ama şık)
    function fish_prompt
        set_color green
        echo -n (prompt_pwd)
        set_color white
        echo -n " 🌱 "
        set_color normal
    end

    # Kısayollar (Aliaslar)
    alias güncelle='sudo pacman -Syu'
    alias kur='sudo pacman -S'
    alias temizle='sudo pacman -Rns (pacman -Qtdq)'
    alias ls='ls --color=auto'
end
