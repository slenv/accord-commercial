#!/bin/bash

# Iniciar API en una nueva terminal
gnome-terminal -- bash -c "cd api && php artisan serve --host 0.0.0.0; exec bash"

# Iniciar web en otra nueva terminal
gnome-terminal -- bash -c "cd web && source ~/.nvm/nvm.sh && nvm use 14 && pnpm start; exec bash"
