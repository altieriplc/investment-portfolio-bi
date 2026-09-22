# Passo a passo — Projeto BI Investimentos (SQLite)

> Arquivo de ações. Curto e direto. Vamos adicionando fases conforme avançamos.

---

## FASE 1 — Conhecer a base (explore)

1. Abrir o banco: `sqlite3 investments.db`
2. Ligar visual: `.headers on` e `.mode column`
3. Listar tabelas: `.tables`
4. Ver estrutura de uma tabela: `.schema dim_client`
5. Contar linhas de cada tabela:
   ```sql
   SELECT 'dim_client' t, COUNT(*) n FROM dim_client
   UNION ALL SELECT 'dim_account', COUNT(*) FROM dim_account
   UNION ALL SELECT 'dim_security', COUNT(*) FROM dim_security
   UNION ALL SELECT 'fact_transaction', COUNT(*) FROM fact_transaction
   UNION ALL SELECT 'fact_position', COUNT(*) FROM fact_position;
   ```
6. Espiar as primeiras linhas de cada tabela: `SELECT * FROM dim_client LIMIT 20;`

---

## FASE 2 — Mapear os erros (data profiling)

Rodar por coluna/tabela. Só detectar aqui — corrigir é na Fase 3.

1. **Nulos e vazios** (nulls):
   ```sql
   SELECT COUNT(*) FROM dim_client WHERE email IS NULL OR TRIM(email) = '';
   ```
2. **Espaços extras / caixa inconsistente** (case & spaces): ver valores distintos.
   ```sql
   SELECT DISTINCT client_type FROM dim_client;
   SELECT DISTINCT transaction_type FROM fact_transaction;
   SELECT DISTINCT asset_class FROM dim_security;
   ```
3. **Duplicatas** (duplicates):
   ```sql
   SELECT client_name, COUNT(*) n FROM dim_client GROUP BY client_name HAVING n > 1;
   SELECT ticker, COUNT(*) n FROM dim_security GROUP BY ticker HAVING n > 1;
   ```
4. **Datas em formatos diferentes** (date formats): as válidas viram data; o resto é NULL.
   ```sql
   SELECT DISTINCT onboarding_date FROM dim_client WHERE DATE(onboarding_date) IS NULL;
   ```
5. **Chaves estrangeiras órfãs** (orphan FKs): filho sem pai.
   ```sql
   SELECT COUNT(*) FROM fact_transaction t
   LEFT JOIN dim_account a ON t.account_id = a.account_id
   WHERE a.account_id IS NULL;
   ```
6. **Valores negativos indevidos** (negatives):
   ```sql
   SELECT COUNT(*) FROM fact_transaction WHERE CAST(quantity AS REAL) < 0;
   SELECT COUNT(*) FROM fact_position   WHERE CAST(market_value AS REAL) < 0;
   ```
7. **Texto em coluna numérica** (text in numeric): o que não é número.
   ```sql
   SELECT DISTINCT close_price FROM fact_price
   WHERE close_price <> '' AND CAST(close_price AS REAL) = 0 AND close_price NOT GLOB '0*';
   ```

---

## FASE 3 — Limpar (create camada tratada)

Regra: nunca alterar a tabela RAW. Criar `VIEW` ou tabela `_clean` a partir dela.

1. **Tirar espaços e padronizar caixa**: `TRIM()` + `UPPER()` / `LOWER()`.
   ```sql
   SELECT UPPER(TRIM(transaction_type)) AS transaction_type_clean FROM fact_transaction;
   ```
2. **Padronizar datas** para ISO: `DATE(coluna)` (valida vira YYYY-MM-DD, inválida vira NULL).
3. **Tratar nulos**: decidir por caso — descartar, preencher com padrão, ou marcar `'Unknown'`.
4. **Remover duplicatas**: manter 1 por chave com `GROUP BY` ou `ROW_NUMBER()`.
5. **Converter numéricos**: `CAST(coluna AS REAL)`; texto (`'N/A'`, `'-'`) vira `NULL`.
6. **Isolar/remover órfãos**: manter só linhas com FK que existe na dimensão (`INNER JOIN`).
7. **Materializar**: criar `dim_client_clean`, `fact_transaction_clean`, etc. → base para o Power BI.

---

---

## REGISTRO DE ACHADOS (profiling)

**Boa prática:** perfilar toda coluna de texto categórica com `GROUP BY` antes de confiar nela. Nunca assumir que o texto está uniforme.

**Achado 1 — `dim_client.client_type`**
- Comando usado:
  ```sql
  SELECT client_type, COUNT(*) FROM dim_client GROUP BY client_type;
  ```
- Resultado: 8 variações para apenas 2 valores reais (`Individual`, `Institutional`).
- Causa: caixa inconsistente (`INDIVIDUAL`, `individual`) + espaços extras (`  Individual `).
- Correção (fase de limpeza): `TRIM()` para remover espaços + padronizar a caixa (ex.: `UPPER()`).

---

## PARA FAZER DEPOIS (backlog)

- **Exemplo de profiling automatizado** — depois de aprender as checagens no braço, montar UM exemplo automatizado (script Python de profiling, ex.: ydata-profiling, ou testes com dbt/Great Expectations) que roda todas as checagens de uma vez em todas as tabelas. Objetivo: mostrar no portfólio que sei escalar o processo, não só fazer manual. Impressiona em entrevista.
- **Dicionário de dados** — já criado (`data_dictionary.xlsx`); manter atualizado.
- **Relatório narrativo de data quality** — no fim, gerar o documento de apresentação (Word/PDF) a partir do issue log.

<!-- Próximas fases (a preencher): FASE 4 Modelagem no Power BI | FASE 5 Medidas DAX | FASE 6 Dashboard | FASE 7 Documentação -->
