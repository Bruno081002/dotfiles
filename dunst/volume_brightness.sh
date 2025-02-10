#!/bin/bash

volume_step=5
brightness_step=5
max_volume=200
notification_timeout=1000
download_album_art=true
show_album_art=true
show_music_in_volume_indicator=true

# Usa regex para pegar o volume com wpctl
function get_volume {
    volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -Po '[0-9]+\.[0-9]+' | head -1)
    if [[ -z "$volume" ]]; then
        volume=0  # Valor padrão se não conseguir pegar o volume
    else
        volume=$(awk "BEGIN {print int($volume * 100)}")  # Converte para porcentagem inteira
    fi
    echo "$volume"
}

# Usa wpctl para pegar o estado de mute

function get_mute {
    mute=$(wpctl get-mute @DEFAULT_AUDIO_SINK@ | grep -Po '(?<=Mute: )(yes|no)')
    
    # Retorna um valor padrão em caso de falha
    if [[ -z "$mute" ]]; then
        mute="no"  # Presume que o sistema não está no estado mute
    fi

    echo "$mute"
}


# Uses regex to get brightness from xbacklight

function get_brightness {
    brightness=$(brightnessctl g)  # Obtém o valor bruto do brilho atual
    max_brightness=$(brightnessctl m)  # Obtém o valor máximo de brilho
    percentage=$((brightness * 100 / max_brightness))  # Calcula o brilho em porcentagem
    echo "$percentage"
}


# Retorna o ícone de volume dependendo do estado do volume
function get_volume_icon {
    volume=$(get_volume)
    mute=$(get_mute)
     if [ "$volume" -eq 0 ] || [ "$mute" == "yes" ]; then
        volume_icon=" "  # Mudo
    elif [ "$volume" -lt 50 ]; then
        volume_icon=" "  # Volume baixo
    else
        volume_icon="  "  # Volume alto
    fi
}

# Sempre retorna o mesmo ícone de brilho
function get_brightness_icon {
    brightness_icon=" "
}

# Função para pegar a arte do álbum
function get_album_art {
    url=$(playerctl -f "{{mpris:artUrl}}" metadata)
    if [[ $url == "file://"* ]]; then
        album_art="${url/file:\/\//}"
    elif [[ $url == "http://"* ]] || [[ $url == "https://"* ]]; then
        # Identifica o nome do arquivo da URL
        filename="$(echo $url | sed "s/.*\///")"

        # Baixa a arte do álbum se não existir no /tmp
        if [ ! -f "/tmp/$filename" ]; then
            wget -O "/tmp/$filename" "$url"
        fi

        album_art="/tmp/$filename"
    else
        album_art=""
    fi
}

# Exibe a notificação de volume
function show_volume_notif {
     mute=$(get_mute)
    get_volume_icon

    if [[ $show_music_in_volume_indicator == "true" ]]; then
        current_song=$(playerctl -f "{{title}} - {{artist}}" metadata)

        if [[ $show_album_art == "true" ]]; then
            get_album_art
        fi
	notify-send -t $notification_timeout -h string:x-dunst-stack-tag:volume_notif -h int:value:$volume -i "$album_art" "$volume_icon $volume%" "$current_song"
    else
        notify-send -t $notification_timeout -h string:x-dunst-stack-tag:volume_notif -h int:value:$volume "$volume_icon $volume%"
    fi
}

# Exibe a notificação de música
function show_music_notif {
    song_title=$(playerctl -f "{{title}}" metadata)
    song_artist=$(playerctl -f "{{artist}}" metadata)
    song_album=$(playerctl -f "{{album}}" metadata)

    if [[ $show_album_art == "true" ]]; then
        get_album_art
    fi

    
	notify-send -t $notification_timeout -h string:x-dunst-stack-tag:music_notif -i "$album_art" "$song_title" "$song_artist - $song_album"
}

# Exibe a notificação de brilho
function show_brightness_notif {
    brightness=$(get_brightness)
    echo $brightness
    get_brightness_icon
    notify-send -t $notification_timeout -h string:x-dunst-stack-tag:brightness_notif -h int:value:$brightness "$brightness_icon $brightness%"
}

# Função principal - Recebe entrada do usuário, como "volume_up", "volume_down", "brightness_up", ou "brightness_down"
case $1 in
    volume_up)
    # Desmuta e aumenta o volume, então exibe a notificação
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0  # Desmuta
    volume=$(get_volume)
   if [ $(( "$volume" + "$volume_step" )) -gt $max_volume ]; then
            wpctl set-volume @DEFAULT_AUDIO_SINK@ $max_volume%
        else
            wpctl set-volume @DEFAULT_AUDIO_SINK@ $volume_step%+
        fi
    show_volume_notif
    ;;

    volume_down)
    # Diminui o volume e exibe a notificação
    wpctl set-volume @DEFAULT_AUDIO_SINK@ $volume_step%-
    show_volume_notif
    ;;


    volume_mute)
    # Alterna o estado de mudo
    mute=$(get_mute)
    if [[ "$mute" == "yes" ]]; then
        # Desmuta e ajusta o volume se necessário
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
        volume=$(get_volume)
        if (( $(echo "$volume == 0" | bc -l) )); then
            wpctl set-volume @DEFAULT_AUDIO_SINK@ ${volume_step}%
        fi
    else
        # Muta
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 1
    fi
    show_volume_notif
    ;;


    brightness_up)
    # Aumenta o brilho e exibe a notificação
    brightnessctl s +$brightness_step%
    show_brightness_notif
    ;;

    brightness_down)
    # Diminui o brilho e exibe a notificação
    brightnessctl s $brightness_step%-
    show_brightness_notif
    ;;

    next_track)
    # Pula para a próxima música e exibe a notificação
    playerctl next
    sleep 0.5 && show_music_notif
    ;;

    prev_track)
    # Volta para a música anterior e exibe a notificação
    playerctl previous
    sleep 0.5 && show_music_notif
    ;;

    play_pause)
    # Alterna play/pause e exibe a notificação
    playerctl play-pause
    show_music_notif
    ;;
esac

