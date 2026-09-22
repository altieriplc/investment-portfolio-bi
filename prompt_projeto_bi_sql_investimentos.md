# Prompt — Projeto de BI (Financeiro/Investimentos) para estudo de Analista de Dados

## Contexto e objetivo

Estou estudando para me tornar analista de dados e quero um projeto de BI completo para portfólio (LinkedIn/mercado internacional). O fluxo é: praticar SQL numa base com erros → limpar e preparar os dados → construir o dashboard no Power BI → documentar. **Como é um projeto de estudo, pesquise as boas práticas atuais de mercado em cada etapa e sempre me recomende elas, explicando o porquê.**

## Base de dados

Você vai **criar uma base de dados fictícia**, na área **financeira/investimentos**, parecida com o que eu encontraria no mercado de trabalho, numa empresa real. **Pesquise na web** práticas, estruturas de tabelas, métricas e nomenclaturas reais da área para se basear e deixar a base realista. Requisitos:

- Base **relacional** (várias tabelas com chaves que permitam `JOIN`).
- Deve conter **erros propositais e sujeira de dados** (nulos, duplicatas, datas em formatos inconsistentes, capitalização bagunçada, chaves estrangeiras órfãs, valores negativos indevidos, texto em colunas numéricas, espaços extras).
- Deve exigir **SQL do básico ao intermediário**: `JOIN`, `CASE WHEN`, `GROUP BY`, filtros, agregações, tratamento de dados sujos.
- Tenho **SQLite instalado** — vou testar as queries lá primeiro e depois levar para o Power BI. Entregue a base em formato compatível (CSV + script de criação/carga `.sql`, e se possível o `.db`).

## Ordem das etapas (siga nesta sequência)

1. Proponha o **schema** (tabelas, colunas, tipos, chaves e relacionamentos) e aguarde minha aprovação **antes de gerar os dados**.
2. Só depois de aprovado, **gere os dados** (com os erros propositais).
3. Me passe **exercícios de SQL** progressivos (do básico ao intermediário) para eu praticar a exploração e limpeza.
4. Avance para **preparação/modelagem** e, por fim, **dashboard** e **documentação**.

## Como quero que você trabalhe

Quero que você me **instrua passo a passo**, cobrindo desde a limpeza e preparação dos dados até a produção do dashboard, com automação caso necessário. Vou conectar você ao Power BI.

**Importante: não saia fazendo as coisas sozinho.** Traga as propostas e eu decido se você executa ou se eu executo com a sua ajuda e instrução.

Ao longo do caminho, quero que você me traga:

- Os principais **KPIs** da área.
- Ideias de **visuais** e de **relacionamentos** (modelagem) para esse trabalho.

## Idioma e formato

- Foco no mercado internacional: meu Power BI está em inglês. Me dê os termos, nomes de KPIs e medidas DAX **em inglês**.
- Sempre que der um termo em inglês, coloque o termo traduzido **entre parênteses**.
- Traga as **medidas DAX uma por uma**, explicando cada uma antes de seguir para a próxima.

## Encerramento

Ao final, faremos juntos a **documentação e o manual do projeto**.
