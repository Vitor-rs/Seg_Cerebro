# Segundo Cérebro

Meu sistema pessoal de conhecimento usando Dendron.

## ⚠️ Como abrir corretamente

### 💻 Local (Windows/Mac/Linux)

**SEMPRE** abra o workspace, não a pasta:

1. **Método 1:** Duplo clique em `inicio.bat` (raiz do projeto)
2. **Método 2:** Execute `scripts\abrir-cerebro.bat`
3. **Método 3:** No VS Code: `File > Open Workspace` → `dendron.code-workspace`
4. **Método 4:** Terminal: `code dendron.code-workspace`

### 🌐 GitHub Codespaces

1. **Automático:** O workspace já abre automaticamente
2. **Manual:** Execute `./scripts/abrir-cerebro-codespaces.sh`
3. **Alternativo:** `File > Open Workspace` → `dendron.code-workspace`

## ✅ Como saber se está funcionando

Quando o Dendron está ativo, você verá:

- 🟢 Bolinha verde no explorer do VS Code
- Comandos Dendron disponíveis (`Ctrl+Shift+P`)
- Graph Panel funcionando

## Como usar

- `Ctrl+Shift+P` → `Dendron: Lookup` - Cria/busca notas
- `Ctrl+Shift+P` → `Dendron: Show Graph` - Mostra o grafo
- `npm run format` - Formata Markdown

## Estrutura

- `vault/` - Todas as suas notas
- `templates/` - Templates para notas
- `scripts/` - Scripts para iniciar o projeto
- `dendron.yml` - Configuração do Dendron
- `inicio.bat` - Atalho rápido para iniciar (Windows)

Só isso! 🧠
