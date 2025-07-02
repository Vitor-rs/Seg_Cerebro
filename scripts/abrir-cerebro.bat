@echo off
echo 🧠 Abrindo Segundo Cerebro (Dendron Workspace)...

REM Verificar se estamos no Codespaces
if defined CODESPACES (
    echo 🌐 Detectado GitHub Codespaces
    echo ✅ Workspace já deve estar ativo no Codespaces
    echo 📝 Use: Ctrl+Shift+P → Dendron: Lookup
) else (
    echo 💻 Ambiente local detectado
    echo 🚀 Abrindo workspace no VS Code...

    REM Voltar para a raiz do projeto se estivermos na pasta scripts
    if exist "..\dendron.code-workspace" (
        cd ..
    )

    code "dendron.code-workspace"
)
