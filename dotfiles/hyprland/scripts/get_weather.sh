#!/usr/bin/env bash

# Verifica se a localização foi fornecida
if [ -z "$1" ]; then
    echo "Usage: $0 <location>"
    echo "Example: $0 Porto+Portugal"
    exit 1
fi

# Localização dinâmica (passada como argumento)
LOCATION="$1"

# Tenta obter os dados do clima
for i in {1..5}; do
    # Faz a requisição ao wttr.in para o texto (formato resumido)
    text=$(curl -s --max-time 5 "https://wttr.in/$LOCATION?format=%c+%t+%h+%w")
    
    # Verifica se a requisição foi bem-sucedida
    if [[ $? == 0 && -n "$text" ]]; then
        # Formata o texto
        text=$(echo "$text" | sed -E "s/\s+/ /g")
        
        # Obtém o tooltip (formato detalhado)
        tooltip=$(curl -s --max-time 5 "https://wttr.in/$LOCATION?format=%l\n%c+%t\nHumidity:+%h\nWind:+%w")
        
        # Verifica se o tooltip foi obtido com sucesso
        if [[ $? == 0 && -n "$tooltip" ]]; then
            tooltip=$(echo "$tooltip" | sed -E "s/\s+/ /g")
            
            # Gera o JSON de saída
            echo "{\"text\":\"$text\", \"tooltip\":\"$tooltip\"}"
            exit 0
        fi
    fi
    
    # Aguarda 1 segundo antes de tentar novamente
    sleep 1
done

# Se todas as tentativas falharem, retorna um erro
echo "{\"text\":\"error\", \"tooltip\":\"error\"}"
exit 1
