#! /bin/bash

text=$(playerctl metadata --format '{{artist}} - {{title}}')
maxlength=35
# if the text is longer than the max length, truncate it and add "..."
if [ ${#text} -gt $maxlength ]; then
    text=${text:0:$maxlength-3}"..."
fi

player=$(playerctl metadata --format '{{playerName}}')
artist=$(playerctl metadata --format '{{artist}}')
title=$(playerctl metadata --format '{{title}}')

# Saída JSON mínima e válida
echo -n "{\"text\": \"$text\", \"tooltip\": \"$player : $artist - $title\"}"
