# Documentação Completa do Dendron

## Índice

1. [Introdução ao Dendron](#introdução-ao-dendron)
2. [Instalação e Primeiros Passos](#instalação-e-primeiros-passos)
3. [Conceitos Fundamentais](#conceitos-fundamentais)
4. [Workspace e Vaults](#workspace-e-vaults)
5. [Hierarquias e Organização](#hierarquias-e-organização)
6. [Schemas](#schemas)
7. [Templates](#templates)
8. [Note References (Referências de Notas)](#note-references-referências-de-notas)
9. [Lookup e Navegação](#lookup-e-navegação)
10. [Comandos e Funcionalidades](#comandos-e-funcionalidades)
11. [Refatoração](#refatoração)
12. [Publicação](#publicação)
13. [CLI (Command Line Interface)](#cli-command-line-interface)
14. [Pods (Import/Export)](#pods-importexport)
15. [Configuração](#configuração)
16. [Melhores Práticas](#melhores-práticas)
17. [FAQ (Perguntas Frequentes)](#faq-perguntas-frequentes)
18. [Troubleshooting](#troubleshooting)

---

## Introdução ao Dendron

### O que é o Dendron?

Dendron é uma ferramenta de tomada de notas hierárquica, baseada em Markdown, local-first e open-source. É construída como uma extensão do VS Code e integra nativamente com IDEs como VS Code e VSCodium.

**Três significados de "Dendron":**

1. **Dendron** é a palavra grega para "árvore" - uma referência à organização hierárquica que o Dendron possibilita
2. **Dendron** é outra palavra para dendrite, uma extensão da célula nervosa que envia e recebe sinais no cérebro. Pense no Dendron como um sistema nervoso digital que ajuda você a consolidar todas as informações importantes da forma mais rápida e eficiente possível
3. **Dendron** é uma ferramenta de gerenciamento de conhecimento que ajuda você a organizar, gerenciar, publicar e colaborar em bases de conhecimento de qualquer tamanho

### Motivação

> "Somos sobrecarregados com informações e não temos as ferramentas para indexá-las e filtrá-las adequadamente. O desenvolvimento dessas ferramentas, que darão à sociedade acesso e comando sobre o conhecimento herdado das eras, deve ser o primeiro objetivo de nossos cientistas" - Vannevar Bush, 1945

### Como Funciona

O Dendron constrói sobre as últimas cinco décadas de linguagens de programação e ferramentas de desenvolvimento. Aplicamos as principais lições do software ao gerenciamento de conhecimento geral. Fazemos o gerenciamento de conhecimento geral como gerenciar código e seu PKM como um IDE.

## Princípios de Design

### Centrado no Desenvolvedor

O Dendron visa criar uma experiência de classe mundial para desenvolvedores no gerenciamento de conhecimento.

Nosso objetivo é fornecer uma ferramenta com:

- A eficiência do Vim
- A extensibilidade do Emacs
- A acessibilidade do VS Code

**Isso significa:**

- Recursos do Dendron são centrados em texto e componíveis
- Fornece a interface de menor atrito para trabalhar com sua base de conhecimento
- Otimiza para eficiência, velocidade e UX focado no teclado
- Vem com padrões sensatos e capacidade de personalizar ao seu gosto
- Pode ser estendido em qualquer dimensão

### Estrutura Gradual

O Dendron estende Markdown com primitivos estruturais para facilitar o gerenciamento em escala e ferramentas em cima para trabalhar com essa estrutura.

Diferentes bases de conhecimento requerem diferentes níveis de estrutura - um PKM usado para manter diários pessoais é diferente de uma base de conhecimento da empresa usada por milhares de desenvolvedores.

O Dendron funciona com qualquer nível de estrutura, permitindo que você faça anotações de forma livre ao começar e gradualmente adicione mais estrutura conforme sua base de conhecimento cresce.

### Flexível e Consistente

O Dendron é flexível e consistente. Fornece uma estrutura consistente para todas as suas notas e oferece flexibilidade para alterar essa estrutura.

No Dendron, você pode refatorar notas e o Dendron garantirá que seu PKM seja consistente. Isso significa que você tem o melhor dos dois mundos: uma estrutura básica para organização, mas flexibilidade para mudá-la.

---

## Instalação e Primeiros Passos

### Pré-requisitos

Antes de começar, certifique-se de fazer o seguinte:

- Instalar o [VS Code](https://code.visualstudio.com/download) ou um editor compatível como [VSCodium](https://vscodium.com/)
- Instalar o [Dendron](https://link.dendron.so/vscode) do marketplace do VS Code

### Inicializar seu Primeiro Workspace

Um workspace é uma coleção de um ou mais vaults. É uma pasta que contém todos os arquivos necessários para gerenciar suas informações no Dendron.

1. Quando você instala o Dendron, verá uma página de boas-vindas
2. Clique no botão "Get Started" para começar
3. Isso inicializará seu primeiro workspace

**Dica:** Se você não vir a tela de boas-vindas, pode abri-la digitando `Ctrl+Shift+P` / `Cmd+Shift+P` para abrir a paleta de comandos e executar `Dendron: Launch Tutorial`.

---

## Conceitos Fundamentais

### Markdown

Markdown é uma marcação leve usada para editar texto. O Markdown permite escrever texto em uma notação simples legível por humanos que é independente de plataforma.

### Frontmatter

Frontmatter é uma maneira conveniente de adicionar informações extras aos seus documentos como um título abreviado ou descrição mais longa. Este tipo de informação é geralmente chamado de metadados e a estrutura usada é chamada YAML.

Exemplo:

```yaml
---
id: exemplo-nota
title: Minha Nota de Exemplo
desc: Esta é uma descrição da nota
updated: 1609459200
created: 1609459200
---
```

### Workspace

Um workspace é uma coleção de um ou mais vaults. É uma pasta que contém todos os arquivos necessários para gerenciar suas informações no Dendron.

### Vaults

Um vault é uma coleção de notas, arquivos e arquivos de configuração.

Se você conhece git, é como um repositório de código. Por padrão, o Dendron cria uma pasta de vaults quando você inicializa um workspace pela primeira vez. Todas as suas notas são armazenadas por vault.

```
.
└── workspace
    ├── vault.main
    │   ├── foo.md
    │   ├── foo.one.md
    │   └── foo.two.md
    └── vault.secret (hipotético)
        ├── secret.one.md
        └── secret.two.md
```

### Hierarquias

O Dendron organiza suas notas em hierarquias. São arquivos Markdown delimitados por `.` ("ponto" ou "período").

**Por que hierarquias?**

Usuários de outras ferramentas de tomada de notas frequentemente questionam o foco do Dendron em hierarquias. O contraargumento comum é que o mundo real não é limitado por hierarquia e que essa abordagem não é flexível o suficiente.

Um grafo é realmente mais flexível. Mas não estamos construindo uma ferramenta para computadores capturarem cada faceta do mundo; estamos construindo uma ferramenta para ajudar humanos a entendê-lo. O desafio que enfrentamos como humanos é a sobrecarga de informações.

Com uma hierarquia, você tem uma fonte única de verdade onde uma nota pode ser arquivada e um processo de filtragem para ajudá-lo a encontrar o lugar certo para arquivar.

As falhas tradicionais das hierarquias passadas eram que eram muito rígidas. O Dendron tem hierarquias flexíveis. Elas fornecem uma estrutura para suas notas, mas essas estruturas podem ser facilmente alteradas.

**Exemplo de hierarquia:**

```
.
├── project1.md
├── project1.designs.md
├── project1.designs.promotion.md
├── project1.paperwork.md
├── project1.paperwork.legal.md
├── project1.tasks.md
├── project1.tasks.task1.md
└── project1.tasks.task2.md
```

### Domain

Um domain é a raiz de uma hierarquia. No exemplo acima, `project1` seria o domain.

### Stubs

Stubs são notas que não existem, mas que você pode querer criar. Elas aparecerão como sugestões nos resultados de lookup. Há duas razões pelas quais essas notas sugeridas podem aparear:

- São o pai não criado de uma nota mais profunda na hierarquia
- São notas possíveis de acordo com o schema

O sinal `+` próximo à sugestão indica que a nota é um stub e não existe.

---

## Workspace e Vaults

### Tipos de Vault

#### Local Vault

Um vault local é uma pasta no seu sistema de arquivos local.

#### Remote Vault

Um vault remoto é um vault que é sincronizado com um repositório git remoto.

#### Workspace Vault

Um vault workspace é um vault especial que contém configuração específica do workspace.

### Multi-Vault

O Dendron suporta múltiplos vaults em um único workspace. Isso permite:

- Separar notas por contexto (trabalho vs pessoal)
- Colaborar em diferentes projetos
- Manter diferentes níveis de privacidade
- Reutilizar vaults entre workspaces

### Configuração de Vault

Cada vault pode ter sua própria configuração:

```yaml
vaults:
  - fsPath: vault1
    name: main
  - fsPath: vault2
    name: work
    remote:
      type: git
      url: https://github.com/usuario/vault-trabalho.git
```

---

## Hierarquias e Organização

### Como Nomear Notas

Recomendações para nomenclatura:

1. **Use kebab-case em minúsculas**: `awesome-apples` em vez de `Awesome Apples`
2. **Use palavras descritivas**: pense em como você procurará a nota
3. **Seja consistente**: mantenha padrões de nomenclatura similares
4. **Evite caracteres especiais**: `(),'` não são permitidos

### Que Tipo de Hierarquia Criar

**Diretrizes:**

- Comece com uma hierarquia relativamente plana
- Adicione tópicos como cabeçalhos nas notas
- Quando as notas crescem ao ponto de precisar rolar, considere dividi-las
- Pense quais ideias são mais fundamentais no seu pensamento

**Exemplo de decisão:**

- `code.excel` vs `excel.code`?
- Depende se você escreverá mais sobre código (onde Excel é um exemplo) ou sobre Excel (onde código é um exemplo)

### Restrições de Nomenclatura

#### Hierarquias Vazias

Hierarquias não podem ser strings vazias:

- Nomes de arquivo não podem começar ou terminar com `.`
- Nomes de arquivo não podem ter pontos consecutivos

```bash
# Bom
foo.bar.md
foo.bar.baz.md

# Ruim
foo..baz.md
.foo.md
foo..md
```

#### Caso Misto

- Use lower-kebab-case para todas as notas, se possível
- Mantenha a capitalização consistente pelo menos por hierarquia

#### Símbolos/Caracteres Especiais

Caracteres não permitidos:

- `(` (parênteses aberto)
- `)` (parênteses fechado)
- `'` (aspas simples)
- `,` (vírgula)

---

## Schemas

### O que são Schemas?

Schemas ajudam você a aplicar estrutura consistente a todas as suas notas. Pense nos schemas como um sistema de tipos opcional para suas notas que descrevem a hierarquia dos seus dados.

Uma das principais capacidades dos schemas é inserir automaticamente templates em novas notas.

### Anatomia de um Schema

Um schema é um arquivo YAML com o esquema de nomenclatura `{nome}.schema.yml`.

Exemplo de schema para comandos CLI:

```yaml
version: 1
schemas:
# isso corresponderá a notas "cli.*"
- id: cli
  desc: interface de linha de comando de referência
  parent: root
  namespace: true
  children:
    - cmd
    - env
# corresponderá a cli.*.env
- id: env
  desc: variáveis de ambiente específicas do cli
# corresponderá a cli.*.cmd.*
- id: cmd
  desc: subcomandos
  namespace: true
```

### Propriedades do Schema

#### ID

O identificador do schema. Também designa o padrão glob de correspondência.

#### TITLE

Este valor aparece na barra de lookup, se você tiver em seu arquivo de configuração de schema.

#### DESC

Descrição legível por humanos do nó do schema. Estas aparecerão automaticamente ao criar notas que correspondem ao schema.

#### PARENT

- Obrigatório apenas para o domínio do schema
- NOTA: pelo menos um schema DEVE ter `parent: root` definido

#### NAMESPACE

Tornar um nó de schema um namespace automaticamente traz seus filhos imediatos como parte do schema, mesmo que não sejam explicitamente definidos na definição do schema.

#### PATTERN

O padrão glob que o schema corresponde. Por padrão, é o `id` do schema.

Exemplos de padrões:

- `"[0-9]"` corresponderá a qualquer dígito
- `"[!0-9]"` corresponderá a qualquer coisa que não seja um dígito
- `"*([0-9])"` corresponderá a 0 ou mais dígitos
- `"+([0-9])"` corresponderá a 1 ou mais dígitos

#### TEMPLATE

Um template que você pode aplicar a todas as notas que correspondem a este schema.

```yaml
template:
  id: journal.template.daily
  type: note
```

### Schema Templates

Aplicar automaticamente um template quando corresponde a um padrão de hierarquia específico. Extremamente útil quando você quer reutilizar o esquema de uma nota.

Exemplos:

- Diários diários
- Listas de compras semanais
- Revisões semanais

### Recursos dos Schemas

#### Schema Completions

Schemas sugerirão automaticamente filhos válidos quando você criar um novo projeto.

#### Schema Hints

Schemas aparecem como ícones próximos aos resultados de lookup.

### Unknown Schema

O Dendron não força você a usar schemas se não quiser. Você pode criar notas que não correspondem a nenhum schema. O Dendron mostrará um `?` próximo a esses resultados.

---

## Templates

### O que são Templates?

Templates são notas cujo conteúdo pode ser copiado para outras notas.

Templates podem ser:

- Aplicados em uma nota aberta com o comando Apply Template
- Aplicados automaticamente na criação de notas com Schemas
- Usados através da opção "Create New with Template" durante lookup

### Casos de Uso

- Templates de diário diário
- Templates de reunião
- Templates de projeto

### Recursos dos Templates

#### Notas Reutilizáveis

Em vez de começar do zero, crie notas que podem ser reutilizadas dentro de outras notas.

```markdown
### Lista de Compras

- [ ] comprar leite
- [ ] comprar flores
- [ ] comprar ovos
```

#### Substituição de Variáveis

Adicione variáveis personalizadas em seu frontmatter e use-as dentro de seus templates:

```yaml
---
name: João
---

Olá {{fm.name}},

Parabéns pela oferta!
```

#### Variáveis de Template

O Dendron vem com variáveis de template pré-definidas que são automaticamente incluídas em seus templates no tempo de execução.

#### Comentários

Comente seu template para lembrar do contexto:

```markdown
<!-- Comentário Markdown, aparecerá quando o template for aplicado -->

{{! Comentário Handlebar, será removido quando o template for aplicado }}
```

#### Condicionais

Use cláusulas if/else para aplicar templates condicionalmente:

```handlebars
{{#if fm.name }}
Olá {{fm.name}}
{{else}}
A quem possa interessar,
{{/if}}
```

#### Helpers Integrados

Funções helper integradas que podem ser usadas com templates handlebars.

Exemplo: Adicionar condicionalmente um bloco dependendo do dia da semana:

```handlebars
{{#if (eq (getDayOfWeek (fnameToDate)) 0) }}
- [ ] fazer lavanderia
{{/if}}
```

### Componentes

#### Handlebar Templates

Use handlebars, uma linguagem de template poderosa que permite condicionais, loops for e helpers personalizados para aplicar aos seus templates sem executar código.

### Começando com Templates

1. Crie uma nota template usando lookup: `template.pr-check-list`
2. Copie e cole o conteúdo:

```markdown
## Tarefas
- [ ] código está testado
- [ ] código tem mensagem de commit adequada
- [ ] código não impacta performance
```

3. Crie uma nova nota: `task.code-check-in`
4. Execute `Dendron: Apply Template`
5. Escolha `template.pr-check-list`

---

## Note References (Referências de Notas)

### O que são Note References?

O Dendron permite referenciar conteúdo de outras notas e incorporá-las em sua nota atual. Isso também é conhecido como transclusão.

### Tipos de Referência

#### Referência de Nota Completa

Uma referência de nota completa inclui todo o conteúdo de uma nota:

```markdown
![[dendron.topic.note-reference.sample]]
```

#### Referências de Cabeçalho

Uma referência de cabeçalho inclui o conteúdo de uma nota começando de um cabeçalho:

```markdown
![[dendron.topic.note-reference.sample#header-1]]
```

#### Referências de Bloco

Uma referência de bloco inclui um bloco Markdown arbitrário. Referências de bloco anexam uma âncora de bloco ao final de algum texto usando o caractere `^` (circunflexo):

Conteúdo fonte:

```markdown
Conteúdo do Header 1.1 ^1f1egthix10t
```

Exemplo de referência de bloco:

```markdown
![[dendron.topic.note-reference.sample#^1f1egthix10t]]
```

#### Referências Posicionais

##### Referência Posicional Begin

Esta referência referenciará o início de uma nota até encontrar o primeiro cabeçalho:

```markdown
![[dendron.topic.note-reference.sample#^begin]]
```

##### Referência Posicional End

Esta referência referenciará o final de uma nota:

```markdown
![[dendron.topic.note-reference.sample#header-1:#^end]]
```

### Referência de Intervalo

Referências também podem incluir um intervalo que fará com que transcluam do `start-anchor` ao `end-anchor`:

```markdown
![[note#{start-anchor}:#{end-anchor}]]
```

Exemplo de um cabeçalho a um cabeçalho:

```markdown
![[dendron.topic.note-reference.sample#header-1:#header-22]]
```

### Comandos

Você pode criar uma referência manualmente ou usando o comando `Copy Note Ref`.

**Atalhos:**

- Windows: `ctrl+shift+r`
- Mac: `cmd+shift+r`

### Opções Avançadas

#### Line Offset

Você pode usar offsets de linha para pular um número de linhas ao usar uma referência de cabeçalho:

```markdown
![[demo.embed.block#head1,1]]
```

#### Wildcard Headers como Limite de Intervalo

Quando você está referenciando um cabeçalho por referência, às vezes você não se importa qual é o próximo cabeçalho, apenas que a referência cubra todo o texto até o próximo cabeçalho:

```markdown
![[demo.embed.block#head1:#*]]
```

#### Referências Recursivas

Referências podem se referir a notas com referências dentro. O Dendron atualmente suporta referências de dois níveis de profundidade.

#### Referência de Link Wildcard

Referências aceitam o operador `*` no final que permite capturar todas as notas de um determinado nível de hierarquia:

```markdown
![[demo.journal.2021.*]]
```

---

## Lookup e Navegação

### O que é Lookup?

Lookup permite encontrar ou criar uma nota. É a principal maneira de trabalhar com notas no Dendron.

**Atalhos:**

- Mac: `cmd+L`
- Windows/Linux: `ctrl+l`

### Como Funciona o Lookup

Por trás dos panos, lookup usa fusejs para fazer correspondência difusa de strings baseada na hierarquia da nota.

O Dendron suporta lookups por palavras-chave separadas por espaços sem ter que conhecer a ordem onde as palavras-chave ocorrem na nota. Por exemplo: `dendron rename` e `rename dendron` ambos corresponderão à nota `dendron.dev.design.commands.rename`.

### Sintaxe de Lookup

Você pode usar a sintaxe de busca estendida do fusejs ao procurar notas:

- **Busca exata**: `'wild`
- **Busca inversa**: `!fire`
- **Busca por prefixo**: `^music`
- **Busca por sufixo**: `.mp3$`
- **Busca difusa**: `sbtrkt`

### Auto Complete no Lookup

Pressionar `Tab` enquanto a visualização de lookup estiver aberta tentará completar automaticamente os resultados. Isso é especialmente útil ao lidar com hierarquias, que adiciona um nível de hierarquia por vez.

### Tipos de Lookup

#### Lookup Note/Create Note

Encontre ou crie uma nota.

#### Lookup Schema

Encontre ou crie um schema.

### Modificadores de Lookup

#### Create New

Criar nova nota sem corresponder a notas existentes.

#### Select All

Selecionar múltiplas notas para operações em lote.

#### Multi-select

Permitir seleção de múltiplas notas.

### Navegação

#### Go Back

- `ctrl-tab` (voltar à aba anterior)
- Clique na aba anterior
- Use o painel de editores abertos

#### Go Forward

Use os atalhos padrão do VS Code para navegação.

#### Find All References

Encontre todas as referências a uma nota ou cabeçalho.

---

## Comandos e Funcionalidades

### Comandos de Notas

#### Browse Note

Abrir o repositório GitHub (se existir) da nota atual.

#### Copy Codespace URL

A URL do Codespace da nota atual é copiada para a área de transferência.

#### Create Daily Journal Note

**Atalhos:**

- Windows: `ctrl+shift+i`
- Mac: `cmd+shift+i`

Criar uma nota de diário global.

#### Copy Note Reference

**Atalhos:**

- Windows: `ctrl+shift+r`
- Mac: `cmd+shift+r`

Copia uma referência ao documento aberto atual.

#### Delete

**Atalhos:**

- Windows: `ctrl+shift+d`
- Mac: `cmd+shift+d`

Excluir uma nota ou schema.

#### Insert Note Index

Inserir um bloco que lista os filhos diretos da nota atual na posição do cursor.

#### Random Note

Navega para uma nota aleatória no workspace.

#### Preview

Visualizar nota em Markdown.

### Comandos de Navegação

#### Lookup Note/Create Note

**Atalhos:**

- Mac: `cmd+L`
- Windows: `ctrl+l`

Iniciar lookup de nota.

#### Create Journal Note

**Atalhos:**

- Windows: `ctrl+shift+j`
- Mac: `cmd+shift+j`

Criar uma nota de diário.

#### Create Scratch Note

**Atalhos:**

- Windows: `ctrl+shift+s`
- Mac: `cmd+shift+s`

Criar uma nota de rascunho.

#### Create Task Note

Criar uma nota de tarefa.

#### Set Task Status

Alterar status de uma nota de tarefa.

#### Complete Task

Marcar nota de tarefa como completa.

#### Create Meeting Note

Criar uma nota de reunião.

### Comandos de Organização

#### Reload Index

Recarregar o índice. Necessário para o Dendron captar mudanças de schema.

### Comandos de Workspace

#### Disable/Enable Telemetry

Desabilitar/habilitar telemetria em todos os workspaces com Dendron.

#### Add Existing Vault

Adicionar um vault existente ao workspace.

#### Create New Vault

Criar um novo vault.

#### Remove Vault

Remover um vault do workspace.

#### Convert Vault

Converter um vault local para remoto ou vice-versa.

#### Initialize Workspace

Criar um novo workspace.

#### Change Workspace

Mudar para workspace existente.

#### Snapshot Vault

Criar um snapshot do seu vault.

#### Restore Vault

Restaurar seu vault de um snapshot.

#### Show Help

Abrir página de ajuda.

#### Configure (yaml)

Modificar configuração do Dendron como YAML bruto.

#### Configure (UI)

Modificar configuração do Dendron usando interface do usuário.

#### Workspace: Sync

Sincronizar todas as notas em todos os vaults com git.

### Comandos de Pods

#### Build Pod

Construir suas notas para exportação.

#### Configure Pod

Atualizar configuração do pod.

#### Import Pod

Importar notas de uma fonte de dados externa.

#### Export Pod

Exportar notas para um destino externo.

#### Publish Pod

Publicar nota para um formato/local diferente.

### Comandos de Publicação

#### Copy Note URL

**Atalhos:**

- Mac: `cmd+shift+u`
- Windows: `ctrl+shift+u`

Obter URL da nota atual do site publicado.

#### Publish

Construir, confirmar e publicar suas notas com um único comando.

#### Publish Export

Construir e exportar suas notas usando publishing v2.

#### Publish Dev

Visualizar suas notas no localhost usando publishing v2.

### Comandos de Desenvolvimento

#### Dump State

Despejar estado interno do Dendron dentro dos logs.

#### Open Logs

Abrir logs do Dendron para sessão atual.

#### Diagnostics Report

Copiar últimas 3000 linhas de todos os logs e configuração para área de transferência.

#### Run Migration

Atualizar arquivo de configuração `dendron.yml` se estiver desatualizado.

---

## Refatoração

### O que é Refatoração?

Recursos que ajudam a atualizar a estrutura do Dendron.

### Recursos

#### Sincronização Automática de Links

- Com refatoração, você pode organizar suas notas sem quebrar links existentes
- Quando renomear, mover ou refatorar, a refatoração garantirá que todos os links afetados sejam atualizados

#### Reorganizar Conhecimento em Qualquer Escala

- Refatorar permite reorganizar seu conhecimento com um único comando independentemente da escala
- Você pode refatorar um cabeçalho em uma nota, uma nota inteira ou múltiplas notas
- Hierarquias inteiras podem ser refatoradas usando expressões regulares

### Refatoração de Conteúdo

#### Move Selection To

Mover o bloco de texto atualmente selecionado para outra nota e atualizar todos os backlinks.

#### Move Header

Mover o cabeçalho selecionado para outra nota.

#### Rename Header

Renomear um cabeçalho e atualizar todos os backlinks para essa nota.

#### Convert Link

Converter link selecionado para outros tipos de links ou texto simples.

### Refatoração de Notas

#### Rename Note

Renomear uma nota e atualizar todos os backlinks para essa nota.

#### Move Note

Mover uma nota para outro vault e atualizar todos os backlinks.

#### Merge Note

Mesclar uma nota em outra nota e atualizar todos os backlinks.

### Refatoração de Hierarquia

#### Refactor Hierarchy

Renomear múltiplas notas usando expressões regulares.

#### Archive Hierarchy

Mover nota atual e todos os filhos sob a hierarquia `archive`.

### Começando com Refatoração

#### Refatorando Cabeçalhos

1. Crie uma nota chamada `foo` com conteúdo:

```markdown
## Um

- Algum conteúdo

## Dois

- Mais conteúdo

### Vamos mais fundo

- Conteúdo profundo
```

2. Crie uma nota chamada `bar` com conteúdo:

```markdown
[[foo#dois]]
```

3. Volte à nota `foo`, posicione o cursor no cabeçalho `Dois`
4. Execute `Dendron: Rename Header` e digite `Segundo`
5. O cabeçalho é renomeado para `Segundo`, e o link na nota `bar` é automaticamente atualizado para `[[foo#segundo]]`

#### Refatorando Notas

**Renomeando uma Nota:**

1. Crie uma nota chamada `foo`
2. Crie outra nota que contém um link para `foo`
3. Volte à nota `foo` e execute `Dendron: Rename Note`
4. Digite `baz` na barra de lookup
5. A nota `foo` é renomeada para `baz`, e o link na nota também é atualizado

**Movendo Notas:**

1. Crie notas chamadas `foo`, `bar`, e `baz`
2. Crie um novo vault local
3. Crie outra nota que linkia para qualquer uma dessas notas
4. Execute `Dendron: Move Note`
5. Selecione as notas que quer mover
6. As notas são movidas e os links são atualizados

#### Refatorando Hierarquia Inteira

1. Crie notas chamadas `foo`, `foo.child`, e `foo.child.grandchildren`
2. Crie outra nota que linka para qualquer uma dessas notas
3. Execute `Dendron: Refactor Hierarchy`
4. Digite `foo` quando solicitado pelo texto de correspondência
5. Digite `bar` quando solicitado pelo texto de substituição
6. Um preview de todas as notas afetadas aparecerá
7. Todas as notas são renomeadas e links são atualizados

---

## Publicação

### O que é Publicação?

O Dendron permite exportar qualquer subconjunto de suas notas como HTML estático via um template Next.js personalizado.

### Recursos

#### Lookup e Busca

A publicação de nova geração inclui uma barra combinada de lookup e busca:

- Busque pelos títulos e conteúdos de suas notas usando a barra de busca
- Para busca semelhante ao comando "Lookup Note", adicione prefixo `/` como `/root`
- Para busca de texto completo, adicione prefixo `?` como `? Onboarding`

#### Índice

A publicação de nova geração inclui um índice (TOC) na navegação esquerda, como uma árvore do site. No lado direito, um TOC é gerado para a página atual.

#### IDs Permanentes

Cada página é publicada usando seu ID único, o que significa que URLs nunca mudarão, mesmo que os nomes dos arquivos mudem.

#### Plataforma de Publicação Open Source Poderosa (via Next.js)

O Dendron publica suas notas usando um template Next.js personalizado otimizado para renderizar notas do Dendron.

### Começando

Veja Publishing Quickstart para instruções detalhadas.

### Configuração

#### Site Config

Configure seu site com propriedades como:

- `siteUrl`: URL base do seu site
- `siteName`: Nome do seu site
- `author`: Autor do site
- `logo`: Caminho para o logo

#### Configuração de Publicação

- `enableHashTags`: Habilitar suporte a hashtags
- `enableUserTags`: Habilitar suporte a tags de usuário
- `enablePrettyRefs`: Usar referências bonitas
- `enableKatex`: Habilitar suporte KaTeX para matemática

### Comandos de Publicação

#### Build

Preparar notas para publicação.

#### Dev

Construir notas e iniciar servidor de desenvolvimento local.

#### Export

Exportar notas como HTML estático.

---

## CLI (Command Line Interface)

### O que é CLI?

O CLI do Dendron expõe a funcionalidade do Dendron via linha de comando.

### Opções Comuns

- `--wsRoot`: localização do workspace
- `--vault`: nome do vault
- `--quiet`: não imprimir saída para stdout
- `--enginePort`: conectar a engine em execução
- `--attach`: usar engine existente
- `--useLocalEngine`: usar engine na memória

### Comandos de Engine

#### doctor

Corrigir suas notas usando doctor.

**Ações disponíveis:**

- `h1ToTitle`: Remover cabeçalho `h1` inicial e usar para substituir conteúdo do campo `title` no frontmatter
- `h1ToH2`: Converter todos os cabeçalhos `h1` iniciais para cabeçalho `h2`
- `removeStubs`: Remover todos os documentos stub
- `createMissingLinkedNotes`: Criar notas que não existem mas têm wikilink para elas
- `regenerateNoteId`: Regenerar IDs das suas notas
- `findBrokenLinks`: Encontrar todos os links quebrados
- `fixRemoteVaults`: Corrigir vaults remotos na configuração
- `addMissingDefaultConfigs`: Adicionar configurações padrão ausentes
- `removeDeprecatedConfigs`: Remover configurações depreciadas

**Exemplo:**

```bash
dendron doctor --wsRoot . --action h1ToTitle --limit 10 --query "readings.*"
```

#### launchEngineServer

Lançar uma instância do engine do Dendron.

**Exemplo:**

```bash
dendron launchEngineServer --wsRoot ~/Dendron/ --port 3005
```

### Comandos de Publicação

#### init

Inicializar template Next.js e todas as dependências.

#### build

Preparar notas para publicação.

#### dev

Construir notas e iniciar servidor de desenvolvimento local.

#### export

Exportar notas como HTML estático.

**Exemplo:**

```bash
dendron publish dev
```

### Comandos de Pod

#### exportPod

Usar pods para exportar suas notas para outro tipo de pod.

**Exemplo:**

```bash
dendron exportPod --podId dendron.json --wsRoot .
```

#### importPod

Usar pods para importar suas notas de outro tipo de pod.

**Exemplo:**

```bash
dendron importPod --podId dendron.markdown --wsRoot .
```

#### publishPod

Publicar uma nota para um pod.

**Exemplo:**

```bash
dendron publishPod --wsRoot . --podId dendron.markdown --query dendron
```

### Comandos de Vault

#### create

Criar um novo vault dentro do workspace.

#### convert

Converter um vault de remoto para local, ou local para remoto.

**Exemplo:**

```bash
dendron vault create --vaultPath kevin-test --wsRoot .
```

### Comandos de Workspace

#### init

Inicializar um workspace.

#### pull

Executar `git pull --rebase` em todos os vaults dentro do workspace.

#### push

Executar `git push` em todos os vaults dentro do workspace.

#### addAndCommit

Executar `git add . && git commit` em todos os vaults dentro do workspace.

#### sync

Executar `addAndCommit`, `pull`, e `push` em todos os vaults dentro do workspace.

### Comandos de Nota

#### get

Obter uma nota por id.

#### find

Encontrar notas por propriedades da nota.

#### lookup

Encontrar ou criar uma nota se uma não existir.

#### delete

Excluir uma nota de um vault.

#### write

Criar uma nova nota se fname/vault não existir ou atualizar corpo de nota existente.

#### move

Mover uma nota para outro vault, ou renomear uma nota dentro de um workspace.

**Exemplos:**

```bash
# Criar/atualizar nota
dendron note write --fname "mytest" --vault "vaultName" --body "this is a body"

# Obter nota
dendron note get --query "noteId"

# Encontrar notas
dendron note find --fname "foo"

# Excluir nota
dendron note delete --fname "foo"

# Mover nota
dendron note move --fname "foo" --destFname "bar"
```

---

## Pods (Import/Export)

### O que são Pods?

Pods são qualquer ferramenta ou local usado para armazenar informações. Ferramentas como Evernote e Roam são pods. Serviços de mídia social como Twitter e Facebook são pods. Destinos de publicação como sites estáticos e Medium são pods.

### Métodos de Pod

#### Import

Importar permite importar em massa notas de uma fonte específica para o Dendron. As notas são formatadas e convertidas para a estrutura hierárquica do Dendron.

#### Export

Exportar permite exportar em massa notas do Dendron para outro destino. As notas serão formatadas e convertidas para o formato nativo do destino.

#### Publish

Publicar permite pegar uma nota e outputá-la em um formato/destino diferente.

### Comandos de Pod

Para acessar pods, o Dendron expõe três comandos:

- `Dendron: Import Pod`: importa notas
- `Dendron: Export Pod`: exporta notas
- `Dendron: Publish Pod`: publica notas

### Pods Integrados

#### Markdown Pod

Importa/exporta arquivos Markdown.

#### JSON Pod

Exporta notas como JSON.

#### Airtable Pod

Sincroniza notas com Airtable.

#### Google Docs Pod

Importa documentos do Google Docs.

#### Notion Pod

Importa/exporta para Notion.

#### Obsidian Pod

Importa notas do Obsidian.

### Configuração de Pods

Cada pod tem sua própria configuração que pode ser personalizada:

```yaml
# Exemplo de configuração para Airtable Pod
pods:
  airtable:
    connectionId: airtable-connection
    tableName: MyTable
    srcFieldMapping:
      title: Title
      body: Body
```

### Usando Pods via CLI

```bash
# Importar de Markdown
dendron importPod --podId dendron.markdown --wsRoot .

# Exportar para JSON
dendron exportPod --podId dendron.json --wsRoot .

# Publicar para Markdown
dendron publishPod --wsRoot . --podId dendron.markdown --query dendron
```

---

## Configuração

### Arquivo dendron.yml

`dendron.yml` está localizado na raiz do seu workspace e pode ser modificado usando o comando `Configure (yaml)`.

### Escopos de Configuração

#### Commands

Configurações relacionadas a comandos.

#### Preview

Configurações relacionadas à pré-visualização.

#### Workspace

Configurações relacionadas ao workspace.

#### Publishing

Configurações relacionadas à publicação.

### Validação e Autocompletar

O Dendron pode fornecer validação ao editar o YAML bruto. Para isso, você deve ter a extensão `redhat.vscode-yaml` instalada.

O validador fornece:

- Autocompletar
- Documentação
- Avisos ao editar dendron.yml

### Configurações Principais

#### Workspace

```yaml
workspace:
  vaults:
    - fsPath: vault
      name: main
  seeds: {}
  disableTelemetry: false
  enableAutoCreateOnDefinition: true
  enableXVaultWikiLink: true
  enableRemoteVaultInit: true
  enableAutoFoldFrontmatter: true
  maxPreviewsCached: 10
  maxNoteLength: 204800
  workspaceVaultSyncMode: skip
```

#### Publishing

```yaml
publishing:
  enableFMTitle: true
  enableNoteTitleForLink: true
  enableMermaid: true
  enablePrettyRefs: true
  enableKatex: true
  enableRandomlyColoredTags: true
  hierarchy:
    enableHierarchyDisplay: true
    hierarchyDisplayTitle: Children
```

#### Preview

```yaml
preview:
  enableFMTitle: true
  enableNoteTitleForLink: true
  enableMermaid: true
  enablePrettyRefs: true
  enableKatex: true
```

#### Commands

```yaml
commands:
  lookup:
    confirmVaultOnCreate: true
    enableAutoCreateOnDefinition: false
  randomNote:
    include: ["**"]
    exclude: []
  insertNoteIndex:
    enableMarker: false
  insertNoteLink:
    aliasMode: none
    enableMultiSelect: false
```

### Configurações Legadas

Muitas configurações estão sendo migradas para novos namespaces. As seguintes configurações são legadas e serão eventualmente depreciadas:

- `generateChangelog`
- `hierarchyDisplayTitle`
- `lookupConfirmVaultOnCreate`
- `noTelemetry`
- `useFMTitle`
- `useKatex`
- `usePrettyRefs`
- `autoFoldFrontmatter`

### Configurações de Desenvolvimento

```yaml
dev:
  enableWebUI: false
  enableExportPodV2: false
  enableSelfContainedVaults: false
```

---

## Melhores Práticas

### Nomenclatura

#### Convenções Recomendadas

1. **Use kebab-case em minúsculas**: `awesome-apples` em vez de `Awesome Apples`
2. **Seja descritivo**: use palavras que você provavelmente usará para encontrar a nota
3. **Seja consistente**: mantenha padrões de nomenclatura similares em hierarquias
4. **Evite caracteres especiais**: `(),'` não são permitidos

#### Exemplos de Nomenclatura

```bash
# Bom
awesome-apples.md → title: Awesome Apples
fruit.awesome-apples.md → title: Awesome Apples
code.javascript.react → title: React

# Evitar
Awesome Apples.md
fruit..awesome-apples.md
code,javascript,react.md
```

### Organização de Hierarquias

#### Diretrizes para Estrutura

1. **Comece simples**: comece com hierarquia plana
2. **Use cabeçalhos**: adicione tópicos como cabeçalhos nas notas
3. **Divida quando necessário**: quando precisar rolar, considere dividir
4. **Pense na fundamentalidade**: coloque ideias mais fundamentais mais próximas à raiz

#### Exemplo de Evolução

```bash
# Início
recipes.md

# Crescimento
recipes.md
recipes.italian.md
recipes.asian.md

# Refinamento
recipes.md
recipes.italian.pasta.md
recipes.italian.pizza.md
recipes.asian.chinese.md
recipes.asian.japanese.md
```

### Usando Dendron Entre Múltiplas Máquinas

#### Método 1: Sincronização em Um Repositório

1. Inicialize repositório git do workspace inteiro:

```bash
cd $workspace
git init
git add .
git commit -m "initial commit"
```

2. Crie host git remoto e faça push
3. Clone o workspace em qualquer máquina

#### Método 2: Sincronização em Múltiplos Repositórios

1. Inicialize git excluindo vault:

```bash
cd $workspace
git init
echo vault >> .gitignore
git add .
git commit -m "initial commit"
```

2. Converta vault para vault remoto
3. Crie host remoto para workspace
4. Clone workspace em outras máquinas

### Schema Design

#### Quando Usar Schemas

- **Para consistência**: garantir estrutura uniforme
- **Para automação**: aplicar templates automaticamente
- **Para autocompletar**: obter sugestões ao criar notas
- **Para escalabilidade**: gerenciar grandes bases de conhecimento

#### Exemplo de Schema Evolutivo

```yaml
# Início simples
version: 1
schemas:
- id: project
  parent: root
  namespace: true

# Refinamento
version: 1
schemas:
- id: project
  parent: root
  children:
    - tasks
    - meetings
    - docs
- id: tasks
  template: templates.task
- id: meetings
  template: templates.meeting
- id: docs
  namespace: true
```

### Template Design

#### Tipos de Templates Úteis

1. **Daily Journal**:

```markdown
---
id: {{fm.date}}
title: {{fm.date}}
desc: Daily journal for {{fm.date}}
---

## 🎯 Goals for Today

## 📝 Notes

## ✅ Accomplishments

## 🤔 Reflections
```

2. **Meeting Template**:

```markdown
---
id: {{fm.id}}
title: Meeting - {{fm.title}}
desc: Meeting notes
---

## 📋 Agenda

## 👥 Attendees

## 📝 Notes

## ✅ Action Items

## 📅 Next Steps
```

3. **Project Template**:

```markdown
---
id: {{fm.id}}
title: {{fm.title}}
desc: Project documentation
---

## 🎯 Objective

## 📋 Requirements

## 🗓️ Timeline

## 👥 Team

## 📊 Status

## 📝 Notes
```

### Workflow Recommendations

#### PKM Workflow

1. **Capture**: use scratch notes para captura rápida
2. **Process**: mova informações para hierarquias apropriadas
3. **Connect**: use note references para conectar conceitos
4. **Review**: use random note para redescobrir conteúdo

#### Team Collaboration

1. **Shared Vaults**: use vaults remotos para colaboração
2. **Consistent Schemas**: defina schemas para estrutura comum
3. **Template Library**: crie biblioteca de templates compartilhados
4. **Publishing**: publique documentação para acesso amplo

---

## FAQ (Perguntas Frequentes)

### Geral

#### O que é um Dendron?

Um Dendron tem muitos significados:

1. **Dendron** é a palavra grega para árvore - referência à organização hierárquica
2. **Dendron** é outra palavra para dendrite, extensão da célula nervosa
3. **Dendron** é uma ferramenta de tomada de notas hierárquica, baseada em Markdown, local-first

#### Como o Dendron é diferente de outras ferramentas?

A maioria das ferramentas PKM ajuda você a criar notas, mas encontra uma parede ao recuperá-las uma vez que sua base de conhecimento atinge um certo limite de tamanho.

**Principal diferencial do Dendron:**

- Foco em estrutura gradual
- Hierarquias flexíveis e consistentes
- Recuperação funciona tão bem com dez notas quanto com dez mil

#### O Dendron é gratuito?

Sim, o Dendron é gratuito e sempre permanecerá gratuito. É também open source.

#### Por que construído em cima do VS Code?

- Evita construir scaffolding de editor diferenciado
- Permite focar em hierarquias e schemas únicos do Dendron
- Core engine não é específico do VS Code
- Planos para editor standalone no futuro

### Notas

#### Por que Markdown?

Markdown permite escrever texto em notação simples legível por humanos que é independente de plataforma. Não precisa do Microsoft Word para ler arquivo Markdown e ferramentas modernas suportam importação e exibição de Markdown.

#### Posso usar Dendron com notas existentes?

Sim, você pode usar o Dendron com repositórios existentes de notas Markdown. Use `Dendron: Change Workspace` para especificar diretório.

#### Como salvar?

O Dendron salva automaticamente quando você muda o foco. Você também pode salvar manualmente usando `Cmd+S` ou `Ctrl+S`.

#### Como voltar à nota anterior?

Três maneiras:

1. `ctrl-tab` (ir à aba anterior)
2. Clique na aba anterior
3. Use painel de editores abertos

### Hierarquias

#### Por que hierarquias?

Um grafo é mais flexível, mas não estamos construindo ferramenta para computadores modelarem perfeitamente o mundo; estamos construindo ferramenta para ajudar humanos a entendê-lo.

Com hierarquia, você tem:

- Uma fonte única de verdade onde nota pode ser arquivada
- Processo de filtragem para encontrar lugar certo para arquivar
- Estrutura para organização, mas flexibilidade para mudar

#### Como devo nomear uma nota?

- Use letras minúsculas
- Substitua espaços por `-`
- Remova caracteres especiais
- Use palavras que provavelmente usará para encontrar a nota

#### Que tipo de hierarquia devo criar?

- Comece com hierarquia relativamente plana
- Adicione tópicos como cabeçalhos
- Divida quando notas ficarem muito grandes
- Pense quais ideias são mais fundamentais

#### Preciso usar hierarquias?

Não, o Dendron também suporta outras formas de organização (backlinks, zettelkasten, etc.). Você pode combinar essas abordagens com hierarquias do Dendron.

### Schemas

#### Preciso usar schemas?

Não, não precisa usar schemas. Mas schemas podem ajudar a gerenciar notas, especialmente conforme coleta mais delas.

Schemas são similares aos tipos oferecidos pelo TypeScript - ajudam a tornar projetos sustentáveis, especialmente conforme crescem.

#### Como schemas funcionam com multi-vault?

- Se dois schemas se sobrepõem entre vaults diferentes, o último schema vence
- Importações de schema atualmente não funcionam entre vaults

### Vaults

#### Git Doc e outras extensões não reconhecem meus repos para multi-vault

Muitas extensões do VS Code que trabalham com múltiplos repositórios Git não reconhecem repos aninhados. A correção é ter seu workspace como última entrada dentro de `folders` no arquivo de workspace.

### Publishing

#### Por que sou levado a uma página 403?

O Dendron auto-gerará páginas 403 durante publicação quando nota publicada linka para notas que não são publicadas.

#### Publishing é gratuito?

Sim, publishing é completamente gratuito! O Dendron gera arquivos HTML que você pode usar GitHub Pages ou qualquer host de site estático.

### Outros Recursos

#### O Dendron suporta data view similar ao Obsidian?

Suportamos data view através do Airtable Pod, que permite mapear frontmatter das suas notas e exportar para Airtable.

#### O Dendron suporta web clipping?

Recomendamos:

- Markdown Web Clipper
- Roam Highlighter

#### O Dendron suporta flashcards?

Recomendamos extensões:

- Recall para VS Code
- Anki para VS Code

#### O Dendron suporta vídeo?

Atualmente não suportamos reprodução de vídeo dentro do VS Code (limitação do webview). Funciona ao publicar, mas não dentro da visualização do VS Code.

---

## Troubleshooting

### Problemas Comuns

#### Dendron não está funcionando

1. **Verifique extensão**: certifique-se que extensão Dendron está instalada e habilitada
2. **Reinicie VS Code**: às vezes restart resolve problemas
3. **Verifique logs**: use `Dendron: Open Logs` para diagnóstico
4. **Engine issues**: tente `Dendron: Reload Index`

#### Performance Issues

1. **Muitas notas**: considere usar multiple vaults
2. **Grandes arquivos**: divida notas grandes em menores
3. **Disable preview**: desabilite preview automático se lento

#### Sync Issues

1. **Git conflicts**: resolva conflitos manualmente
2. **Remote vault issues**: verifique configuração de vault remoto
3. **Permissions**: certifique-se que tem permissões para repos

#### Schema Issues

1. **Schema não aplicando**: execute `Dendron: Reload Index`
2. **Schema errors**: valide YAML do schema
3. **Template not found**: verifique se template existe

#### Publishing Issues

1. **Build failures**: verifique logs de build
2. **Missing assets**: certifique-se que assets estão em lugares corretos
3. **Broken links**: use doctor para encontrar links quebrados

### Comandos de Diagnóstico

#### Dendron: Doctor

Use para corrigir problemas comuns:

- `h1ToTitle`: corrigir frontmatter titles
- `removeStubs`: remover notas stub
- `findBrokenLinks`: encontrar links quebrados
- `fixRemoteVaults`: corrigir configuração de vaults

#### Dendron: Diagnostics Report

Copia informações de diagnóstico:

- Últimas 3000 linhas de logs
- Configuração do workspace
- Status de instalação de extensões

### Recursos de Ajuda

#### Documentação

- Wiki oficial: <https://wiki.dendron.so/>
- Getting Started: guia completo para começar
- Reference docs: documentação técnica detalhada

#### Comunidade

- Discord: <https://link.dendron.so/discord>
- GitHub: <https://github.com/dendronhq/dendron>
- Newsletter: atualizações regulares

#### Suporte

- GitHub Issues: reporte bugs e solicite recursos
- Discord: suporte da comunidade
- Office Hours: sessões regulares com equipe

---

## Recursos Avançados

### Hooks

Hooks permitem executar código personalizado durante eventos do ciclo de vida do Dendron.

#### Tipos de Hooks

- `onCreate`: executado quando nota é criada
- `onDelete`: executado quando nota é deletada (planejado)
- `onChange`: executado quando nota é modificada (planejado)

#### Criando Hook

Use `Dendron: Hook Create` para criar hook personalizado:

- `hookName`: nome do hook
- `hookFilter`: padrão glob para filtrar notas
- `hookType`: onde anexar o hook

### Extensions

#### Extensões Recomendadas

1. **Markdown All in One**: melhor suporte a Markdown
2. **Paste Image**: colar imagens facilmente
3. **GitLens**: melhor integração Git
4. **Spell Checker**: verificação ortográfica
5. **Todo Tree**: rastrear TODOs

#### Configuração VS Code

Configurações recomendadas para melhor experiência:

```json
{
  "workbench.editor.enablePreview": false,
  "workbench.editor.showTabs": true,
  "editor.minimap.enabled": false,
  "outline.showProperties": false,
  "editor.quickSuggestions": {
    "strings": true
  }
}
```

### Customização

#### Snippets Personalizados

Crie snippets para agilizar workflow:

```json
{
  "Daily Journal": {
    "prefix": "daily",
    "body": [
      "## Goals",
      "- $1",
      "",
      "## Notes",
      "- $2",
      "",
      "## Accomplishments",
      "- $3"
    ]
  }
}
```

#### Keybindings Personalizados

```json
{
  "key": "ctrl+j",
  "command": "dendron.createDailyJournalNote"
}
```

### Performance

#### Otimizações

1. **Cache management**: configure cache appropriadamente
2. **Preview settings**: desabilite preview se não usar
3. **Index settings**: configure indexing para suas necessidades

#### Monitoramento

Use métricas para monitorar performance:

- Tempo de startup
- Tempo de lookup
- Uso de memória

---

Esta documentação abrangente do Dendron fornece uma base sólida para entender e utilizar todas as funcionalidades da ferramenta. Use-a como referência rápida ou guia de aprendizado conforme explora o sistema de gerenciamento de conhecimento do Dendron.

O Dendron é uma ferramenta poderosa que cresce com suas necessidades - desde simples anotações até bases de conhecimento complexas. Com hierarquias flexíveis, schemas poderosos, e recursos avançados de publicação, oferece uma solução completa para gerenciamento de conhecimento moderno.
