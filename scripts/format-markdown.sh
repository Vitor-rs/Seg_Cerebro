#!/usr/bin/env bash

# Script para formatar arquivos Markdown automaticamente
# Uso: ./format-markdown.sh [arquivo.md] ou ./format-markdown.sh (para todos os .md)

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}🔧 Formatador de Markdown Automático${NC}"
echo "========================================="

# Função para verificar se o markdownlint está instalado
check_markdownlint() {
    if ! command -v markdownlint &> /dev/null; then
        echo -e "${RED}❌ markdownlint não encontrado. Instalando...${NC}"
        npm install -g markdownlint-cli
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✅ markdownlint instalado com sucesso!${NC}"
        else
            echo -e "${RED}❌ Erro ao instalar markdownlint${NC}"
            exit 1
        fi
    else
        echo -e "${GREEN}✅ markdownlint encontrado${NC}"
    fi
}

# Função para formatar um arquivo específico
format_file() {
    local file="$1"
    echo -e "${YELLOW}📝 Formatando: $file${NC}"

    # Fazer backup do arquivo original
    cp "$file" "$file.backup"

    # Aplicar correções automáticas
    markdownlint --fix "$file" 2>/dev/null

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✅ $file formatado com sucesso${NC}"
        # Remover backup se a formatação foi bem-sucedida
        rm "$file.backup"
    else
        echo -e "${RED}❌ Erro ao formatar $file${NC}"
        # Restaurar backup em caso de erro
        mv "$file.backup" "$file"
    fi
}

# Verificar se markdownlint está instalado
check_markdownlint

# Se um arquivo específico foi fornecido
if [ "$1" ]; then
    if [ -f "$1" ]; then
        format_file "$1"
    else
        echo -e "${RED}❌ Arquivo não encontrado: $1${NC}"
        exit 1
    fi
else
    # Formatar todos os arquivos .md no diretório atual e subdiretórios
    echo -e "${YELLOW}🔍 Procurando arquivos Markdown...${NC}"

    find . -name "*.md" -type f | while read file; do
        format_file "$file"
    done
fi

echo -e "${GREEN}🎉 Formatação concluída!${NC}"
