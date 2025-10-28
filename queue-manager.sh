#!/bin/bash
# queue-manager.sh
# Control global de workers Laravel en subdominios

BASE_DIR="$HOME/public_html"
COMMAND="$1"

if [ -z "$COMMAND" ]; then
    echo "Uso: $0 {start|stop|restart|status}"
    exit 1
fi

# Recorre todos los subdominios
for project_dir in "$BASE_DIR"/*; do
    # Solo directorios
    [ -d "$project_dir" ] || continue

    # Buscar si tiene tradeApi/ o api/
    for api_dir in "$project_dir/tradeApi" "$project_dir/api"; do
        if [ -d "$api_dir" ]; then
            script="$api_dir/queue-worker.sh"
            if [ -f "$script" ]; then
                echo "========================================================================"
                echo "📦 Proyecto: $(basename "$project_dir") → $(basename "$api_dir")"
                echo "📁 Ruta: $api_dir"
                echo "🔧 Ejecutando: $COMMAND"
                echo "========================================================================"
                (cd "$api_dir" && bash "$script" "$COMMAND")
                echo ""
            else
                echo "⚠️ No se encontró queue-worker.sh en $api_dir"
            fi
        fi
    done
done
