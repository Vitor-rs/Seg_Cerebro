# Script PowerShell para formatar arquivos Markdown automaticamente
# Uso: .\format-markdown.ps1 [arquivo.md] ou .\format-markdown.ps1 (para todos os .md)

param(
    [string]$FilePath = ""
)

# Cores para output
$Red = "Red"
$Green = "Green"
$Yellow = "Yellow"

Write-Host "🔧 Formatador de Markdown Automático" -ForegroundColor $Yellow
Write-Host "========================================="

# Função para verificar se o markdownlint está instalado
function Check-MarkdownLint {
    try {
        $null = Get-Command markdownlint -ErrorAction Stop
        Write-Host "✅ markdownlint encontrado" -ForegroundColor $Green
        return $true
    }
    catch {
        Write-Host "❌ markdownlint não encontrado. Instalando..." -ForegroundColor $Red
        try {
            npm install -g markdownlint-cli
            Write-Host "✅ markdownlint instalado com sucesso!" -ForegroundColor $Green
            return $true
        }
        catch {
            Write-Host "❌ Erro ao instalar markdownlint" -ForegroundColor $Red
            return $false
        }
    }
}

# Função para formatar um arquivo específico
function Format-MarkdownFile {
    param([string]$File)

    Write-Host "📝 Formatando: $File" -ForegroundColor $Yellow

    # Fazer backup do arquivo original
    $backupFile = "$File.backup"
    Copy-Item $File $backupFile

    try {
        # Aplicar correções automáticas
        & markdownlint --fix $File 2>$null

        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ $File formatado com sucesso" -ForegroundColor $Green
            # Remover backup se a formatação foi bem-sucedida
            Remove-Item $backupFile -Force
        }
        else {
            Write-Host "❌ Erro ao formatar $File" -ForegroundColor $Red
            # Restaurar backup em caso de erro
            Move-Item $backupFile $File -Force
        }
    }
    catch {
        Write-Host "❌ Erro ao executar markdownlint para $File" -ForegroundColor $Red
        # Restaurar backup em caso de erro
        Move-Item $backupFile $File -Force
    }
}

# Verificar se markdownlint está instalado
if (-not (Check-MarkdownLint)) {
    exit 1
}

# Se um arquivo específico foi fornecido
if ($FilePath) {
    if (Test-Path $FilePath) {
        Format-MarkdownFile $FilePath
    }
    else {
        Write-Host "❌ Arquivo não encontrado: $FilePath" -ForegroundColor $Red
        exit 1
    }
}
else {
    # Formatar todos os arquivos .md no diretório atual e subdiretórios
    Write-Host "🔍 Procurando arquivos Markdown..." -ForegroundColor $Yellow

    $markdownFiles = Get-ChildItem -Path . -Filter "*.md" -Recurse

    foreach ($file in $markdownFiles) {
        Format-MarkdownFile $file.FullName
    }
}

Write-Host "🎉 Formatação concluída!" -ForegroundColor $Green
