#!/bin/bash

# Iniciar API en una nueva terminal
gnome-terminal -- bash -c "cd api && php artisan serve; exec bash"

# Iniciar web en otra nueva terminal
gnome-terminal -- bash -c "cd web && source ~/.nvm/nvm.sh && nvm use 14 && bun start; exec bash"
