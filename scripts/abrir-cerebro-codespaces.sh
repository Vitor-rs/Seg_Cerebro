#!/bin/bash
# Script para abrir o Segundo Cérebro no GitHub Codespaces

echo "🧠 Abrindo Segundo Cérebro (Dendron Workspace) no Codespaces..."

# Voltar para a raiz do projeto se estivermos na pasta scripts
if [ -f "../dendron.code-workspace" ]; then
    cd ..
fi

# No Codespaces, o workspace já é aberto automaticamente
# Mas vamos garantir que o Dendron está ativo
echo "🔧 Verificando se o Dendron está ativo..."

# Verificar se as dependências estão instaladas
if [ ! -d "node_modules" ]; then
    echo "� Instalando dependências..."
    npm install
fi

echo "✅ Segundo Cérebro pronto no Codespaces!"
echo ""
echo "📝 Como usar:"
echo "  - Ctrl+Shift+P → Dendron: Lookup (criar/buscar notas)"
echo "  - Ctrl+Shift+P → Dendron: Show Graph (mostrar grafo)"
echo "  - npm run format (formatar Markdown)"
