select
    categorie,
    devise,
    count(*) as nombre_transactions,
    sum(montant) as montant_total,
    avg(montant) as montant_moyen,
    min(montant) as montant_min,
    max(montant) as montant_max
from {{ ref('transactions') }}
where montant is not null
and statut in ('validé', 'en attente')
group by categorie, devise
order by montant_total desc