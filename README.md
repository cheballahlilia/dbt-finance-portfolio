# dbt Finance Portfolio

Projet dbt de transformation et validation de données Finance.

## Stack technique

- dbt Core 1.11
- DuckDB (local) + BigQuery (cloud)
- Python 3.13

## Modèles

- `transactions_summary` — agrégation des transactions par statut
- `transactions_by_category` — agrégation par catégorie et devise

## Tests natifs (9 au total)

- not_null, unique sur transactions_summary
- not_null, accepted_values sur transactions_by_category

## Lancer le projet

### En local (DuckDB)
```bash
dbt seed
dbt run
dbt test
```

### Sur BigQuery
```bash
dbt seed --profile dbt_finance_bq
dbt run --profile dbt_finance_bq
dbt test --profile dbt_finance_bq
```

## Configuration BigQuery

- Project : `data-quality-portfolio`
- Dataset : `finance`
- Location : `europe-west1`
- Auth : Google Cloud OAuth (gcloud auth application-default login)

## Résultats sur BigQuery

- 500 transactions chargées
- 2 vues créées : `transactions_summary`, `transactions_by_category`
- 9/9 tests passés ✅