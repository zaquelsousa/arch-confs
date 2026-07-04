#!/usr/bin/env bash
# ~/.config/polybar/test-image.sh

IMAGE="/home/zakk/imagens/teste.png"   # ← mude se o caminho for diferente

if [[ -f "$IMAGE" ]]; then
    echo "%{I:40}${IMAGE}%{I}   ← Teste de Imagem"
else
    echo "Imagem não encontrada em: $IMAGE"
fi
