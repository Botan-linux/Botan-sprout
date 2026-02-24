# Bash açıldığında otomatik olarak Fish'e geç
if [[ $- == *i* ]]; then
    exec fish
fi
