# Documentação Completa do Dendron - Knowledge Base Offline

## Introdução e Visão Geral

**Dendron é uma ferramenta de anotações hierárquica, baseada em Markdown, local-first e open-source.** Projetado como um sistema de cache para tudo que importa - se você gastou mais de cinco minutos resolvendo um problema, nunca deveria gastar tempo novamente resolvendo o mesmo problema exato.

Dendron é uma **base de conhecimento construída por e para desenvolvedores** que se integra nativamente com IDEs como VS Code e VSCodium. Aplica lições-chave do desenvolvimento de software ao gerenciamento de conhecimento geral, fazendo com que gerenciar conhecimento seja como gerenciar código e seu PKM seja como uma IDE.

### Filosofia e Motivação

> "Estamos sobrecarregados com informações e não temos as ferramentas para indexar e filtrar adequadamente através delas. [O desenvolvimento dessas ferramentas, que] dará à sociedade acesso e comando sobre o conhecimento herdado das eras [deveria] ser o primeiro objetivo dos nossos cientistas" - Vannevar Bush (1945)

### Princípios de Design Fundamentais

#### 1. Centrado no Desenvolvedor
- **Objetivo**: Criar uma experiência de desenvolvedor de classe mundial para gerenciar conhecimento
- **Meta**: Fornecer uma ferramenta com a eficiência do Vim, a extensibilidade do Emacs, e a acessibilidade do VS Code
- **Características**:
  - Interface centrada em texto e composável
  - Interface de menor atrito possível
  - Otimizado para eficiência e UX focada no teclado
  - Padrões sensatos com customização
  - Extensível em qualquer dimensão

#### 2. Estrutura Gradual
- **Filosofia**: Dendron estende markdown com primitivas estruturais para facilitar o gerenciamento em escala
- **Flexibilidade**: Diferentes bases de conhecimento requerem diferentes níveis de estrutura
- **Evolução**: Você pode fazer anotações de forma livre quando começar e gradualmente adicionar mais estrutura conforme sua base de conhecimento cresce

#### 3. Flexível e Consistente
- **Consistência**: Fornece uma estrutura consistente para todas as suas notas
- **Flexibilidade**: Dá flexibilidade para mudar essa estrutura
- **Refatoração**: Como na programação, você pode refatorar notas e o Dendron garantirá que seu PKM seja consistente

## Sistema de Hierarquias e Organização

### Conceitos Fundamentais

#### O que são Hierarquias
As hierarquias no Dendron usam notação delimitada por pontos para organizar notas em uma estrutura flexível que pode ser facilmente refatorada. Diferente de sistemas de pastas rígidos que "se ossificam no momento em que são criados", as hierarquias do Dendron podem ser facilmente alteradas e refatoradas.

**Exemplo de Estrutura Hierárquica:**
```
project1.md
project1.designs.md
project1.designs.promotion.md
project1.paperwork.md
project1.paperwork.legal.md
project1.tasks.md
project1.tasks.task1.md
project1.tasks.task2.md
```

#### Filosofia das Hierarquias

**Design Centrado no Humano:**
- "Não estamos construindo uma ferramenta para computadores capturarem cada faceta do mundo; estamos construindo uma ferramenta para ajudar humanos a dar sentido a ele"
- **Solução para Sobrecarga de Informação**: "O desafio que enfrentamos como humanos é a sobrecarga de informação. Há muito dela e precisamos de maneiras de restringir essa complexidade"
- **Sistema de Filtragem**: "Filtrar grandes quantidades de informação em subconjuntos exponencialmente menores é para o que as hierarquias são feitas"

#### Conceitos-Chave

- **Markdown**: Linguagem de marcação leve para edição de texto
- **Frontmatter**: Metadados YAML no início das notas para informações adicionais
- **Workspace**: Coleção de um ou mais vaults contendo todos os arquivos
- **Vault**: Coleção de notas, arquivos e arquivos de configuração
- **Domain**: Raiz de uma hierarquia (ex: "project1" no exemplo acima)
- **Stubs**: Notas sugeridas que ainda não existem mas podem ser criadas
- **Pods**: Mecanismos para importar e exportar notas

### Estrutura de Arquivos

```
workspace/
├── dendron.code-workspace
├── dendron.yml
├── .dendron.port
├── .dendron.meta
├── docs/
├── .gitignore
└── vault/
    ├── root.md
    ├── root.schema.md
    ├── dendron.md
    ├── dendron.faq.md
    └── assets/images/
```

## Instalação e Configuração Inicial

### Pré-requisitos
1. **Instalar VS Code ou VSCodium**
2. **Instalar extensão Dendron** do marketplace do VS Code

### Processo de Configuração Inicial

**1. Instalar Extensão**: Obter Dendron do marketplace do VS Code

**2. Lançar Tutorial**: Após instalação, clicar "Get Started" ou usar Command Palette com "Dendron: Launch Tutorial"

**3. Inicializar Workspace**: Cria estrutura de pastas com arquivos de configuração necessários

**Elementos-Chave da Interface:**
- **Command Palette**: Ctrl+Shift+P / Cmd+Shift+P para comandos do Dendron
- **Lookup Bar**: Ctrl+L para criação/busca de notas
- **Preview Pane**: Visualização renderizada do Markdown
- **Sidebar**: Navegação e explorador de arquivos

## Comandos Completos do VS Code

### Comandos de Gerenciamento de Notas

#### Dendron: Lookup (Ctrl+L)
- **Interface principal** para interagir com notas
- Criar, encontrar e deletar notas
- Suporta correspondência difusa em caminhos
- Consciente de multi-vault com rotulagem de vaults
- Suporta modificadores para funcionalidade aprimorada

#### Comandos de Criação de Notas
- **`Dendron: Create Daily Journal Note`**: Cria notas de diário diárias sob `daily.{date}`
- **`Dendron: Create Journal Note`**: Cria notas de diário com hierarquia baseada em domínio
- **`Dendron: Create Meeting Note`**: Notas estruturadas de reunião com participantes e próximos passos
- **`Dendron: Create Scratch Note`**: Notas de rascunho autocontidas
- **`Dendron: Create Task Note`**: Notas especiais com frontmatter específico para tarefas

#### Comandos de Refatoração de Notas
- **`Dendron: Rename Note`**: Renomear nota e atualizar todos os backlinks
- **`Dendron: Move Note`**: Mover nota para outro vault e atualizar backlinks
- **`Dendron: Delete Note`**: Deletar com detecção de links quebrados
- **`Dendron: Archive Hierarchy`**: Mover nota e filhos sob hierarquia de arquivo
- **`Dendron: Refactor Hierarchy`**: Operações de hierarquia em massa

#### Operações de Cabeçalhos
- **`Dendron: Move Header`**: Mover cabeçalho selecionado para outra nota
- **`Dendron: Rename Header`**: Renomear cabeçalho e atualizar todos os backlinks

### Comandos de Preview e Navegação

#### Comandos de Preview
- **`Dendron: Show Preview`**: Preview HTML rico das notas
- **`Dendron: Toggle Preview`**: Alternar painel de preview
- **`Dendron: Toggle Preview Lock`**: Travar/destravar estado do preview

#### Comandos de Navegação
- **`Dendron: Go to Sibling`**: Navegar entre notas irmãs (Ctrl+Shift+] / Ctrl+Shift+[)
- **`Dendron: Show Note Graph`**: Representação gráfica visual das notas

### Comandos de Referência e Vinculação

#### Gerenciamento de Links
- **`Dendron: Copy Note Link`**: Criar referência para nota atual
- **`Dendron: Copy Header Reference`**: Referenciar cabeçalhos específicos
- **`Dendron: Convert Link`**: Converter entre tipos de links
- **`Dendron: Insert Note Index`**: Inserir bloco listando filhos diretos

### Comandos de Gerenciamento de Workspace

#### Operações de Vault
- **`Dendron: Vault Add`**: Adicionar novo vault local ou remoto
- **`Dendron: Vault Remove`**: Remover vault do workspace
- **`Dendron: Vault Convert`**: Converter entre vaults locais e remotos

#### Configuração
- **`Dendron: Configure (yaml)`**: Editar configuração `dendron.yml`
- **`Dendron: Initialize Workspace`**: Configurar novo workspace do Dendron

### Comandos de Importação/Exportação

#### Comandos Pod
- **`Dendron: Export Pod`**: Exportar notas para formatos externos
- **`Dendron: Import Pod`**: Importar notas de fontes externas
- **`Dendron: Configure Export Pod V2`**: Configurar configurações de exportação
- **`Dendron: Configure Service Connection`**: Configurar conexões de serviço

### Comandos Utilitários

#### Comando Doctor (`Dendron: Doctor`)
Manutenção abrangente do workspace com múltiplas ações:
- **`fixFrontmatter`**: Corrigir frontmatter malformado
- **`h1ToTitle`**: Converter cabeçalhos H1 para títulos de notas
- **`h1ToH2`**: Converter cabeçalhos H1 para H2
- **`removeStubs`**: Remover notas stub
- **`createMissingLinkedNotes`**: Criar notas referenciadas por wikilinks
- **`regenerateNoteId`**: Regenerar IDs de notas
- **`findBrokenLinks`**: Encontrar e listar links quebrados
- **`fixRemoteVaults`**: Corrigir configurações de vault remoto
- **`fixAirtableMetadata`**: Atualizar metadados do Airtable
- **`addMissingDefaultConfigs`**: Adicionar configurações padrão ausentes
- **`removeDeprecatedConfigs`**: Remover configurações depreciadas
- **`fixSelfContainedVaultsInConfig`**: Corrigir configurações de vault autocontido
- **`fixKeybindingConflicts`**: Detectar e corrigir conflitos de atalhos de teclado

#### Comandos de Snapshot
- **`Dendron: Snapshot Vault`**: Criar snapshot completo do vault
- **`Dendron: Restore Vault`**: Restaurar do snapshot

#### Outros Comandos Utilitários
- **`Dendron: Reload Index`**: Atualizar índice de notas
- **`Dendron: Show Help`**: Abrir documentação de ajuda
- **`Dendron: Disable Telemetry`**: Desabilitar rastreamento de uso
- **`Dendron: Open Logs`**: Visualizar logs do Dendron

## Interface de Linha de Comando (CLI)

### Estrutura Core do CLI
```bash
dendron <command> [options]
```

**Opções comuns entre comandos:**
- `--wsRoot`: Localização do workspace
- `--vault`: Nome do vault
- `--quiet`: Não imprimir saída para stdout
- `--enginePort`: Conectar ao engine em execução
- `--attach`: Usar engine existente
- `--useLocalEngine`: Usar engine em memória

### Comandos de Notas
```bash
dendron note <cmd>
```

**Sub-comandos:**
- **`lookup`**: Encontrar ou criar notas
- **`delete`**: Deletar notas do vault
- **`move`**: Mover/renomear notas dentro do workspace
- **`get`**: Obter nota por ID
- **`find`**: Encontrar notas com critérios específicos

**Parâmetros:**
- `--query`: Consulta de busca
- `--output`: Formato de saída (`json`, `md_gfm`, `md_dendron`)
- `--fname`: Nome do arquivo para encontrar/escrever
- `--body`: Conteúdo do corpo para novas notas
- `--destFname`: Novo nome para operações de mudança
- `--destVaultName`: Vault de destino para mudanças

### Comandos de Workspace
```bash
dendron workspace <cmd>
```

**Sub-comandos:**
- **`init`**: Inicializar novo workspace
- **`sync`**: Sincronizar com git (equivalente a Workspace: Sync)
- **`addAndCommit`**: Git add e commit de mudanças
- **`pull`**: Git pull com rebase em todos os vaults

### Comandos Doctor
```bash
dendron doctor [options]
```

**Opções:**
- `--action`: Ação específica do doctor para executar
- `--query`: Executar doctor sobre consulta específica
- `--limit`: Limitar número de mudanças
- `--dryRun`: Prévia de mudanças sem aplicar
- `--podId`: ID do pod Airtable para atualizações de metadados

### Comandos Pod
```bash
dendron pod <cmd>
```

**Sub-comandos:**
- **`export`**: Exportar notas usando pods
- **`import`**: Importar notas usando pods
- **`publish`**: Publicar notas individuais

**Opções Comuns de Pod:**
- `--podId`: Identificador do pod
- `--showConfig`: Exibir configuração do pod
- `--genConfig`: Gerar configuração do pod
- `--podPkg`: Nome do pacote pod customizado
- `--config`: Parâmetros de configuração inline
- `--podSource`: Fonte do pod (`builtin` ou `custom`)

### Comandos de Publicação
```bash
dendron publish <cmd>
```

**Sub-comandos:**
- **`init`**: Inicializar configuração de publicação
- **`build`**: Construir site para publicação
- **`dev`**: Iniciar servidor de desenvolvimento
- **`export`**: Exportar para publicação

**Opções:**
- `--dest`: Sobrescrever localização do template Next.js
- `--noBuild`: Pular construção de notas
- `--overrides`: Sobrescrever propriedades siteConfig
- `--target`: Destino de exportação específico
- `--sitemap`: Gerar sitemap
- `--yes`: Auto-confirmar prompts

### Comandos de Vault
```bash
dendron vault <cmd>
```

**Sub-comandos:**
- **`create`**: Criar novo vault
- **`convert`**: Converter tipo de vault (local ↔ remoto)

## Configuração Completa (dendron.yml)

### Estrutura do Arquivo de Configuração

**Localização**: `{workspace-root}/dendron.yml`

**Estrutura Básica:**
```yaml
version: 1
vaults:
  - fsPath: vault
    name: vault
workspace:
  # configurações específicas do workspace
publishing:
  # configurações específicas de publicação
preview:
  # configurações específicas de preview
dev:
  # configurações de desenvolvimento
```

### Configuração do Workspace (namespace `workspace`)

#### Configuração de Diário
```yaml
workspace:
  journal:
    dailyDomain: daily
    name: journal
    dateFormat: y.MM.dd
    addBehavior: childOfDomainNamespace
```

#### Configuração de Notas Scratch
```yaml
workspace:
  scratch:
    name: scratch
    dateFormat: y.MM.dd.HHmmss
    addBehavior: asOwnDomain
```

#### Configuração de Tarefas
```yaml
workspace:
  task:
    name: task
    dateFormat: y.MM.dd
    addBehavior: asOwnDomain
    statusSymbols:
      "": " "
      "wip": "w"
      "done": "x"
      "assigned": "a"
      "moved": "m"
      "blocked": "b"
      "delegated": "l"
      "dropped": "d"
      "pending": "y"
    prioritySymbols:
      "H": "high"
      "M": "medium"
      "L": "low"
    todoIntegration: false
    taskCompleteStatus: ["done", "x"]
```

#### Sincronização de Vault
```yaml
workspace:
  workspaceVaultSyncMode: noCommit # Opções: noCommit, noPush, skip
  enableAutoCreateOnDefinition: false
  enableXVaultWikiLink: false
  enableRemoteVaultInit: true
  enableUserTags: true
  enableHashesForFMTags: false
  workspaceTrust: true
```

#### Configurações Gerais do Workspace
```yaml
workspace:
  enableAutoFoldFrontmatter: false
  maxPreviewsCached: 10
  maxNoteLength: 204800
```

### Configuração de Publicação (namespace `publishing`)

#### Configurações Básicas de Publicação
```yaml
publishing:
  siteUrl: https://example.com
  siteRootDir: docs
  siteIndex: root
  enableSiteLastModified: true
  enableFMTitle: true
  enableNoteTitleForLink: true
  enablePrettyRefs: true
  enableKatex: false
  enableHashesForFMTags: false
  enableRandomlyColoredTags: true
  copyAssets: true
  assetsPrefix: /
  logoPath: assets/logo.png
  siteFaviconPath: favicon.ico
  writeStubs: false
  enableHierarchyDisplay: true
  hierarchyDisplayTitle: title
  duplicateNoteBehavior:
    action: useVault
    payload: [vault1, vault2]
```

#### Configuração SEO
```yaml
publishing:
  seo:
    title: "Título do Site"
    description: "Descrição do site para SEO"
    author: "Nome do Autor"
    twitter: "@twitter_handle"
    image:
      url: "https://example.com/image.png"
      alt: "Descrição da imagem do site"
```

#### Integração GitHub
```yaml
publishing:
  github:
    enableEditLink: true
    editLinkText: "Editar esta página no GitHub"
    editBranch: main
    editViewMode: tree
```

#### Configuração de Hierarquias do Site e Vault
```yaml
publishing:
  siteHierarchies:
    - root
    - blog
  hierarchy:
    root:
      publishByDefault: true
      noIndexByDefault: false
      customFrontmatter:
        - key: "layout"
          value: "default"
```

### Configuração de Preview (namespace `preview`)
```yaml
preview:
  enableFMTitle: true
  enableNoteTitleForLink: true
  enableFrontmatterTags: true
  enableHashesForFMTags: false
  enablePrettyRefs: true
  enableKatex: false
  automaticallyShowPreview: false
  theme: light # Opções: light, dark, custom
```

### Configuração de Desenvolvimento (namespace `dev`)
```yaml
dev:
  enableWebUI: false
  enableSelfContainedVaults: false
  enableExportPodV2: false
  enableLinkCandidates: false
  enablePreviewV2: false
```

## Integração com VSCode

### Arquivo dendron.code-workspace
Arquivo de configuração de workspace específico do VSCode que:
- Configura vaults e pastas do workspace
- Recomenda instalação de extensões úteis
- Configura configurações do VSCode específicas para Dendron

**Estrutura:**
```json
{
  "folders": [
    {
      "path": "vault",
      "name": "vault"
    },
    {
      "path": "."
    }
  ],
  "settings": {
    // configurações específicas do VSCode
  },
  "extensions": {
    "recommendations": [
      // extensões recomendadas
    ]
  }
}
```

### Extensões Recomendadas
Dendron recomenda automaticamente estas extensões:
- `redhat.vscode-yaml` - Validação YAML e autocomplete para dendron.yml
- `dendron.dendron-paste-image` - Funcionalidade de colar imagem
- `dendron.dendron-markdown-shortcuts` - Atalhos de edição Markdown

### Configurações Específicas do VSCode
Localizadas em dendron.code-workspace ou configurações do VSCode:

```json
{
  "settings": {
    "dendron.logLevel": "INFO",
    "dendron.enableTelemetry": true,
    "dendron.rootDir": ".",
    "dendron.dendronDir": "dendron",
    "dendron.defaultTimestampDecorationFormat": "DATETIME_MED",
    "pasteImage.defaultName": "image-${YY}${MM}${DD}-${HH}${mm}${ss}",
    "pasteImage.path": "${currentFileDir}/assets/images",
    "markdown-preview-enhanced.enableWikiLinkSyntax": true,
    "markdown-preview-enhanced.wikiLinkFileExtension": ".md",
    "editor.snippetSuggestions": "inline",
    "editor.suggest.snippetsPreventQuickSuggestions": false,
    "editor.tabCompletion": "on"
  }
}
```

### Atalhos de Teclado e Comandos VSCode

#### Comandos de Navegação Core
- **Lookup**: `Ctrl+L` (Mac: `Cmd+L`) - Encontrar ou criar notas
- **Schema Lookup**: `Ctrl+Shift+L` (Mac: `Cmd+Shift+L`) - Trabalhar com schemas
- **Go to Note**: `Ctrl+Enter` - Navegar para nota sob cursor

#### Comandos de Criação de Notas
- **Create Daily Journal**: `Ctrl+Shift+I` (Mac: `Cmd+Shift+I`)
- **Create Journal Note**: `Ctrl+Shift+J` (Mac: `Cmd+Shift+J`)
- **Create Scratch Note**: `Ctrl+Shift+S` (Mac: `Cmd+Shift+S`)
- **Create Task Note**: Sem atalho padrão

#### Comandos de Edição e Refatoração
- **Copy Note Ref**: `Ctrl+Shift+R` (Mac: `Cmd+Shift+R`)
- **Copy Note Link**: `Ctrl+Shift+U` (Mac: `Cmd+Shift+U`)
- **Delete Note**: `Ctrl+Shift+D` (Mac: `Cmd+Shift+D`)
- **Rename Note**: Via command palette
- **Move Note**: Via command palette

### Atalhos de Teclado Personalizados
Adicionar ao `keybindings.json`:
```json
[
  {
    "key": "ctrl+shift+t y",
    "command": "dendron.setTaskStatus",
    "when": "editorFocus && dendron:pluginActive",
    "args": {
      "setStatus": "y"
    }
  },
  {
    "key": "cmd+k t",
    "command": "dendron.exportPodv2",
    "args": {
      "podId": "my-pod-id"
    }
  }
]
```

## Schemas Completos e Documentação

### O que são Schemas?

Schemas são um sistema de tipos opcional para suas notas que descrevem a hierarquia dos seus dados e são representados como uma hierarquia eles mesmos. Eles ajudam a aplicar estrutura consistente a todas as suas notas e inserir automaticamente templates em novas notas.

### Estrutura de Arquivo Schema

- Arquivos schema usam a convenção de nomenclatura: `{name}.schema.yml`
- Localizados na raiz do seu workspace
- Escritos em formato YAML

### Sintaxe Básica de Schema
```yaml
version: 1
schemas:
  - id: cli  # corresponde a notas "cli.*"
    desc: referência de interface de linha de comando
    parent: root
    namespace: true  # permite filhos arbitrários (padrão glob cli.*)
    children:
      - cmd
      - env
  - id: env
    desc: variáveis de ambiente específicas do cli
  - id: cmd
    desc: subcomandos
    namespace: true  # corresponde cli.*.cmd.*
```

### Sintaxe de Schema Inline (Simplificada)
```yaml
version: 1
schemas:
  # Daily é o schema de nível superior
  - id: daily
    parent: root
    title: daily
    desc: ""
    children:
      - pattern: journal
        children:
          # padrão YYYY
          - pattern: "[0-2][0-9][0-9][0-9]"
            children:
              # padrão MM  
              - pattern: "[0-1][0-9]"
                children:
                  # padrão DD
                  - pattern: "[0-3][0-9]"
                    desc: Five Minute Journal
                    template: templates.daily-5mj
```

### Propriedades de Schema

- **id**: Identificador único usado para construir padrão glob
- **title**: Título legível por humanos
- **desc**: Descrição do schema
- **parent**: Schema pai (root para nível superior)
- **namespace**: Quando true, permite filhos arbitrários (equivalente ao glob *)
- **pattern**: Padrão glob personalizado para correspondência de notas
- **children**: Array de schemas filhos
- **template**: Template para aplicar automaticamente

### Correspondência de Padrões
- Usa padrões glob para correspondência flexível
- Exemplos: `cli.*`, `cli.*.cmd`, `cli.*.cmd.*`
- Padrões personalizados: `"[0-2][0-9][0-9][0-9]"` para anos
- Padrão padrão usa id do schema se não especificado

### Importações de Schema
```yaml
version: 1
imports:
  - bar  # importa bar.schema.yml
schemas:
  - id: foo
    parent: root
    children:
      - bar.bar  # referencia schema importado
```

### Comandos de Schema
- `Dendron: Create Schema From Note Hierarchy` - Gerar schema de notas existentes
- `Dendron: Show Schema Graph` - Visualizar relacionamentos de schema
- `Dendron: Lookup (Schema)` - Navegar e editar schemas

## Templates Completos e Documentação

### O que são Templates?

Templates são notas cujo conteúdo pode ser copiado para outras notas. Eles podem ser aplicados manualmente ou automaticamente através de schemas.

### Métodos de Aplicação de Template

1. **Apply Template Command** - Inserção manual em nota aberta
2. **Schema Templates** - Aplicação automática na criação de nota
3. **Create New with Template** - Seletor de template durante lookup

### Criação Básica de Template

1. Criar uma nota na hierarquia `templates` (recomendado)
2. Adicionar seu conteúdo de template
3. Aplicar usando comando `Apply Template` ou schema

### Exemplo de Template (Notas de Reunião)
```markdown
# Reunião: {{title}}

**Data:** {{date}}
**Participantes:** 
- {{attendees}}

## Agenda
- 

## Notas
- 

## Itens de Ação
- [ ] 

## Próximos Passos
- 
```

### Integração de Template Schema
```yaml
version: 1
schemas:
  - id: meeting
    parent: root
    pattern: "meet.*"
    template:
      id: templates.meet
      type: note
```

### Sintaxe de Template Encurtada
```yaml
# Abreviado - padrão para type: note
template: templates.daily-5mj

# Sintaxe completa
template:
  id: templates.daily-5mj
  type: note
```

### Sintaxe de Template Cross-Vault
```yaml
template: dendron://myVault/journal.template.daily
```

### Templating Avançado com Handlebars

**Integração Handlebars:**
Dendron suporta linguagem de templating Handlebars para geração dinâmica de conteúdo.

**Variáveis de Template:**
- `{{title}}` - Título da nota
- `{{date}}` - Data atual
- `{{time}}` - Hora atual
- `{{fname}}` - Nome do arquivo
- `{{fm.property}}` - Acesso a propriedade do frontmatter

**Funções Helper Integradas:**

**Funções de Data:**
```handlebars
<!-- Converter nome do arquivo para objeto data -->
{{fnameToDate}}

<!-- Obter dia da semana (0=Domingo, 6=Sábado) -->
{{getDayOfWeek (fnameToDate)}}

<!-- Formatar datas -->
{{date "YYYY-MM-DD"}}
```

**Lógica Condicional:**
```handlebars
{{#if fm.name}}
Olá {{fm.name}}
{{else}}
Para quem possa interessar,
{{/if}}

<!-- Conteúdo específico do dia -->
{{#if (eq (getDayOfWeek (fnameToDate)) 0)}}
- [ ] fazer lavanderia (tarefa de domingo)
{{/if}}
```

**Correspondência de String:**
```handlebars
<!-- Extrair padrão de data do nome do arquivo -->
[[writing.journal.{{match FNAME "\\d{4}\\.\\d{2}\\.\\d{2}"}}]]
```

**Helper de Comparação:**
```handlebars
{{#if (eq variable "value")}}
Conteúdo quando igual
{{/if}}
```

## Integração com Repositórios Git

### Tipos de Workspace

#### Code Workspaces
- Incluem arquivo `dendron.code-workspace`
- Configuram vaults e recomendam extensões úteis
- Ótimos para configurar bases de conhecimento

#### Native Workspaces
- Não têm arquivo `dendron.code-workspace`
- Úteis ao integrar com projetos existentes

### Integração Git

#### Comando Workspace: Sync
- Sincroniza todas as notas em todos os vaults com git
- Faz commit de todas as mudanças, puxa do remoto, depois empurra de volta para o remoto
- Suporta opções de configuração por vault em `dendron.yml`
- Opções de configuração:
  - `sync`: Sincronização completa (padrão para vaults regulares)
  - `noCommit`: Puxa e empurra atualizações mas não faz commit (padrão para workspace vaults)
  - `noPush`: Faz commit e puxa mas não empurra

#### Vaults Remotos
- Repositórios Git que podem ser clonados e gerenciados
- Configurados em `dendron.yml` com URL git
- Automaticamente inicializados quando workspace é puxado
- Suportam operações git padrão (push, pull, merge, blame)

#### Configuração Multi-Vault
```yaml
vaults:
  - fsPath: vault-public
    name: public
    visibility: public
  - fsPath: vault-private
    name: private
    visibility: private
  - fsPath: vault-shared
    name: shared
    remote:
      type: git
      url: https://github.com/org/shared-vault.git
```

#### Configuração de Vault Remoto
```yaml
vaults:
  - fsPath: external-vault
    remote:
      type: git
      url: git@github.com:username/vault.git
      branch: main
```

## Sistema de Publicação Completo

### Configuração de Publicação Next.js

**Configuração Inicial:**
```bash
# Navegar para raiz do workspace
cd your-dendron-workspace

# Inicializar publicação
npx dendron publish init

# Preview localmente
npx dendron publish dev

# Construir para produção
npx dendron publish export
```

**Configuração (dendron.yml):**
```yaml
site:
  siteUrl: https://yourusername.github.io
  siteName: Minha Base de Conhecimento
  siteHierarchies:
    - root  # Publicar tudo, ou especificar hierarquias
  siteRootDir: docs
  assetsPrefix: /repo-name  # Para GitHub Pages
  copyAssets: true
  title: Meu Jardim Digital
  author: Seu Nome
  description: Sistema de gerenciamento de conhecimento pessoal
  logo: assets/images/logo.png
  favicon: assets/favicon.ico
  
  # Controles de publicação
  config:
    root:
      publishByDefault: true
      # Configurações por hierarquia
    private:
      publishByDefault: false
```

### Métodos de Publicação

1. **GitHub Pages com GitHub Actions** (Recomendado)
2. **GitHub Pages Manual**
3. **Netlify**
4. **Vercel**
5. **Hospedagem personalizada**

#### Publicação GitHub Pages

**Método GitHub Actions (Recomendado):**
1. Usar repositório template: `dendronhq/template.publish.github-action`
2. Configurar `dendron.yml` com sua URL do site
3. Habilitar GitHub Pages nas configurações do repositório
4. Implantação automática no push para branch main

**GitHub Pages Manual:**
```bash
# Construir site estático
npx dendron publish export

# Mover para diretório docs
mv .next/out docs

# Commit e push
git add .
git commit -m "Atualizar site publicado"
git push
```

#### Publicação Netlify

**Processo de Configuração:**
1. Conectar repositório GitHub ao Netlify
2. Configurar configurações de build:
   - Comando de build: `./dendron-publish-site.sh`
   - Diretório de publicação: `docs`
3. Adicionar script de build à raiz do repositório

**Script de Build (dendron-publish-site.sh):**
```bash
#!/usr/bin/env bash
# Remover diretório docs se presente
rm -rf docs

# Instalar dependências
yarn

# Atualizar template Next.js do Dendron
(test -d .next) && (echo 'atualizando dendron next...' && cd .next && git reset --hard && git pull && yarn && cd ..) || (echo 'init dendron next' && yarn dendron publish init)

# Gerar site estático
yarn dendron publish export

# Mover para diretório docs
mv .next/out docs
```

### Recursos Avançados de Publicação

#### Temas Personalizados
Criar `custom.css` na raiz do workspace:
```css
/* Exemplo de tema personalizado */
body {
  background: #c5dcff;
}

.site-layout-sidebar.ant-layout {
  background: #e0e0e0;
}

a, a:hover, a:active {
  color: #00629b;
}
```

#### Configuração SEO
```yaml
site:
  siteUrl: https://example.com
  title: Minha Base de Conhecimento
  description: Gerenciamento de conhecimento pessoal abrangente
  author: Seu Nome
  twitter: @yourusername
  logo: assets/images/social-logo.png
```

#### Controle de Navegação
- Usar `nav_order` no frontmatter para ordenação personalizada
- `nav_exclude: true` para ocultar notas da navegação
- Navegação hierárquica gerada automaticamente

#### Gerenciamento de Assets
- Imagens e arquivos automaticamente copiados quando `copyAssets: true`
- Assets acessíveis via caminhos relativos
- Suporte para vários tipos de mídia

## Workflows e Melhores Práticas

### Workflow de Diário Diário

**Schema: daily.schema.yml**
```yaml
version: 1
schemas:
  - id: daily
    parent: root
    children:
      - pattern: journal
        children:
          - pattern: "[0-2][0-9][0-9][0-9]"
            children:
              - pattern: "[0-1][0-9]"
                children:
                  - pattern: "[0-3][0-9]"
                    template: templates.daily-journal
```

**Template de Diário Diário:**
```markdown
# Diário Diário - {{date}}

## Reflexão Matinal
### Gratidão
Eu sou grato por:
1. 
2. 
3. 

### Objetivos Diários
O que tornaria hoje ótimo?
1. 
2. 
3. 

### Afirmações
Eu sou...

## Reflexão Noturna
### Conquistas
Coisas incríveis que aconteceram hoje:
1. 
2. 
3. 

### Melhorias
Como eu poderia ter tornado hoje melhor?
- 

## Tarefas
- [ ] 
- [ ] 
- [ ] 

## Notas
```

### Workflow de Notas de Reunião
Comando: `Dendron: Create Meeting Note`
- Auto-gera schema e template
- Padrão: `meet.YYYY.MM.DD`
- Personalizável para múltiplas reuniões por dia

### Workflow de Gerenciamento de Tarefas

**Estrutura de Nota de Tarefa:**
```yaml
---
id: task-example
title: Completar documentação do projeto
status: open
priority: high
due: 2024.01.15
owner: alice
tags:
  - work
  - documentation
---

## Descrição
Completar a documentação do projeto incluindo:
- [ ] Referência da API
- [ ] Guia do usuário
- [ ] Instruções de instalação

## Notas
Reunião com stakeholders agendada para próxima semana.
```

### Workflow Getting Things Done (GTD)
1. **Capturar**: Usar notas scratch para captura rápida
2. **Esclarecer**: Processar em hierarquias apropriadas
3. **Organizar**: Usar schemas e templates para consistência
4. **Refletir**: Revisões semanais e diárias
5. **Engajar**: Notas de tarefa orientadas à ação

### Workflow Acadêmico
- Notas de literatura para artigos de pesquisa
- Mapas conceituais usando hierarquias
- Integração de gerenciamento de citações
- Organização baseada em curso
- Estrutura de tese/dissertação

### Workflow de Criação de Conteúdo
- Hierarquia de rascunho para diferentes tipos de conteúdo
- Template para posts de blog, artigos
- Workflow de publicação para múltiplas plataformas
- Gerenciamento de assets para arquivos de mídia

### Workflow de Colaboração em Equipe
- Vaults compartilhados para conhecimento da equipe
- Publicação para documentação externa
- Sincronização de vault remoto
- Controle de acesso baseado em permissões

## Sistema de Pods (Importação/Exportação)

### Tipos de Pod

#### Pods Builtin
- **Markdown Import Pod**: Importação em massa de arquivos Markdown
- **Google Docs Import Pod**: Importação com autenticação OAuth
- **Airtable Export Pod**: Exportação para Airtable
- **JSON Export Pod**: Exportação como JSON estruturado
- **GitHub Import/Export Pod**: Integração com issues do GitHub

#### Pods Personalizados
- Desenvolvidos pela comunidade, pacotes instaláveis
- Estrutura de desenvolvimento personalizada
- Lógica de publicação personalizada

### Comandos Pod

1. **Import**: Importação em massa de fonte para Dendron
2. **Export**: Exportação em massa do Dendron para destino
3. **Publish**: Nota única para formato/destino diferente

### Configuração de Pod

**Markdown Import Pod:**
```bash
# Uso CLI
dendron importPod --podId dendron.markdown --wsRoot . --vault main
```

**Google Docs Import Pod:**
```yaml
src: gdoc
vaultName: vault
owner: dendronhq
accessToken: "your-access-token"
refreshToken: "your-refresh-token"  
importComments: 
  enable: true
  format: text
confirmOverwrite: true
```

**Airtable Export Pod:**
```yaml
podType: AirtableExportPod
connectionId: "airtable-connection"
tableId: "your-table-id"
sourceFieldMapping:
  title: "Name"
  priority: "Priority"
  status: "Status"
filters:
  - "tags contains 'task'"
```

### Desenvolvimento de Pod Personalizado

**Estrutura de Pod:**
```javascript
module.exports = {
  async publish({note, dest, config}) {
    // Lógica de publicação personalizada
    return {
      url: publishedUrl,
      status: 'success'
    };
  }
};
```

**Instalação:**
```bash
cd {workspace}
npm init -y
npm install --save {custom-pod-package}
dendron-cli publishPod --wsRoot . --podId custom.pod.id
```

## Recursos Avançados

### Referências de Notas
- Referencias de bloco com sintaxe `((ref: ))` (depreciado)
- Sistema moderno de referência de notas
- Referencias de nível de cabeçalho
- Referencias de intervalo para múltiplos blocos
- Referencias cross-vault com sintaxe `dendron://vault/note`

### Sistema Multi-Vault
- Tipos de vault local e remoto
- Configurações específicas de vault
- Linking e busca cross-vault
- Repositórios git independentes por vault
- Registro de vault para compartilhamento

### Visualização de Graph
- Representação visual de relacionamentos de notas
- Personalização com CSS Cytoscape.js
- Filtros e controles de visualização
- Navegação interativa

### Backlinks
- Rastreamento automático de links bidirecionais
- Exibição em painel lateral
- Navegação entre notas relacionadas
- Suporte para referencias de cabeçalho

## Customização e Personalização

### Customização de Tema

#### Temas de Preview
```yaml
preview:
  theme: light # Opções: light, dark, custom
```

Para temas personalizados, criar `custom.css` na raiz do workspace:
```css
body, .ant-layout {
  background-color: #002b5c;
}

body, h1, h2, h3, h4 {
  color: #ffffff;
}

a, a:hover, a:active {
  color: #b2f7ef;
}
```

#### Temas de Publicação
```yaml
publishing:
  theme: dark # Opções: default, dark, custom
```

### Customização de Cores
Cores de aba do VSCode baseadas em schema:
```yaml
schemas:
  - id: project
    tabColor: 
      value: "#FFFFFF"
      recursive: false
```

### Customização de Snippets
Snippets personalizados do VSCode em `dendron.code-snippets`:
```json
{
  "Create Meeting Note": {
    "prefix": "meeting",
    "body": [
      "# ${1:Meeting Title}",
      "",
      "## Attendees",
      "- ${2:Name}",
      "",
      "## Agenda",
      "- ${3:Item}",
      "",
      "## Notes",
      "${4:Content}",
      "",
      "## Action Items",
      "- [ ] ${5:Task}"
    ]
  }
}
```

## Recursos da Comunidade

### Estrutura da Comunidade
- **Discord Ativo** com canais e funções definidos
- **Eventos Regulares da Comunidade** (Office Hours, Greenhouse Talks)
- **Sistema CROP** - Solicitação da Comunidade para recursos do Produto
- **Funções de Contribuidor** - Bug Catchers, Dendrologists, Speakers, etc.
- **Canais de Suporte** - FAQ, solução de problemas, contribuições de documentação

### Calendário da Comunidade
- Eventos semanais destacando lançamentos, posts de blog, insights da comunidade
- Office Hours regulares para suporte e discussão
- Greenhouse Talks para apresentações da comunidade
- New User Tuesdays para onboarding

### Recursos de Aprendizado
- Estudos de caso e workflows
- Demos de workflow Bullet Journaling e GTD
- Tutorial de template Five Minute Journal
- Guias de gerenciamento de tarefas
- Configuração de diário diário

### Contribuições
- **GitHub** - Repositório principal de código e issues
- **Documentação** - Contribuições para wiki e guias
- **Schemas Comunitários** - Biblioteca compartilhada de schemas
- **Pods Personalizados** - Desenvolvimento de pod da comunidade

## Resolução de Problemas e Manutenção

### Comandos Doctor
- `fixFrontmatter` - Corrigir frontmatter malformado
- `h1ToTitle` - Converter cabeçalhos H1 para títulos de notas
- `removeStubs` - Remover notas stub
- `createMissingLinkedNotes` - Criar notas referenciadas por wikilinks
- `findBrokenLinks` - Encontrar e listar links quebrados
- `fixRemoteVaults` - Corrigir configurações de vault remoto

### Problemas Comuns

#### Template de Schema Não Funcionando
- Verificar se padrão de schema corresponde ao nome da nota
- Verificar se arquivo de template existe
- Executar `Dendron: Reload Index` após mudanças de schema
- Validar sintaxe YAML

#### Problemas de Publicação
- Verificar configuração `siteUrl` e `assetsPrefix`
- Verificar links quebrados no conteúdo publicado
- Garantir que assets sejam copiados corretamente
- Validar sintaxe do frontmatter

### Otimização de Performance
```json
{
  "dendron.enableLegacyNoteRef": false,
  "dendron.maxNoteLength": 204800,
  "dendron.maxPreviewsCached": 10,
  "files.watcherExclude": {
    "**/.dendron/**": true,
    "**/build/**": true,
    "**/node_modules/**": true
  }
}
```

## Requisitos Técnicos

### Requisitos do Sistema
- **VS Code**: Versão 1.60.0 ou posterior
- **Git**: Versão 2.0.0 ou posterior
- **Node.js**: Necessário para recursos de publicação
- **Sistemas Operacionais**: Windows, macOS, Linux

### Uso de Porta
- Servidor Dendron roda em localhost (porta configurável)
- Servidor de preview tipicamente usa porta 3000
- Pode requerer configuração de firewall

### Estrutura do Sistema de Arquivos
```
workspace/
├── dendron.code-workspace
├── dendron.yml
├── dendronrc.yml (opcional)
├── custom.css (opcional)
├── .dendron.port
├── .dendron.meta
├── .gitignore
├── vault/
│   ├── root.md
│   ├── root.schema.yml
│   └── assets/
├── templates/ (opcional)
├── hooks/ (opcional)
└── .backup/
```

## Migração e Configuração

### Validação YAML
- Instalar extensão `redhat.vscode-yaml`
- Validação automática no comando Configure (YAML)
- Autocomplete e avisos baseados em schema

### Migração de Configuração
- Prompts automáticos para configurações desatualizadas
- Migração manual via `Dendron: Dev: Run Migration`
- Arquivos de backup criados em `.backup/config/`

### Override de Configuração Local (dendronrc.yml)
Permite overrides de configuração personalizada sem modificar o dendron.yml principal:
- **Escopo WORKSPACE**: `{workspace-root}/dendronrc.yml`
- **Escopo GLOBAL**: `{HOME}/dendronrc.yml`

## Conceitos Avançados

### Self-Contained Vaults
- Recurso de preview inicial para vaults standalone
- Elimina dependência de workspace
- Compartilhamento e distribuição simplificados
- Portabilidade aprimorada

### Suporte Web
- Compatibilidade limitada com VS Code na Web
- Integração GitHub.dev (pressionar '.' no repositório GitHub)
- Conjunto de recursos reduzido comparado ao desktop
- Desenvolvimento contínuo para suporte web completo

### Note Traits
- Comportamentos avançados de notas
- Modificadores personalizados de nome
- Lógica de criação personalizada
- Extensibilidade através de JavaScript

### Integração de Automação
- Tarefas do VS Code para criação automática de notas
- Scripts de backup automatizados
- Workflow GitHub Actions para publicação automatizada
- Variáveis de template com lógica de data

---

Esta documentação completa cobre todos os aspectos do Dendron, desde conceitos básicos até recursos avançados, fornecendo uma knowledge base offline abrangente para uso como referência no GitHub Copilot no VSCode. A documentação inclui exemplos práticos, configurações detalhadas, e workflows do mundo real para implementação efetiva das capacidades do Dendron.