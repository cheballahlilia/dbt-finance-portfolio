select
    statut,
    count(*) as nombre_transactions,
    sum(montant) as montant_total,
    avg(montant) as montant_moyen
from {{ ref('transactions') }}
where montant is not null
and statut in ('validé', 'en attente')
group by statut