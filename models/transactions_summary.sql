select
    statut,
    count(*) as nombre_transactions,
    sum(montant) as montant_total,
    avg(montant) as montant_moyen
from {{ ref('transactions') }}
where montant is not null
and statut is not null
group by statut