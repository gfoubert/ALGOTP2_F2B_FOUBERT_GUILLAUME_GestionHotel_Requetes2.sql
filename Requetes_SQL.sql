--1 Classement des clients par nombre d'occupations--

SELECT CLI_NOM,CHB_PLN_CLI_NB_PERS 
from T_CLIENT as A,TJ_CHB_PLN_CLI as B 
where A.CLI_ID=B.CLI_ID 
order by CHB_PLN_CLI_NB_PER

--2 Classement des occupations par mois
select count(CHB_PLN_CLI_OCCUPE),strftime ('%m',PLN_JOUR) 
from TJ_CHB_PLN_CLI 
group by strftime ('%m',PLN_JOUR)

--3 Montant TTC de chaque ligne de facture (avec remise)--

--4 Tarif moyen des chambres par étage et années croissantes--
select  avg(TRF_CHB_PRIX),TRF_DATE_DEBUT 
from TJ_CHB_TRF  
order by  strftime('%y',TRF_DATE_DEBUT)

--5 Chambre la plus chère et en quelle année--
select max(TRF_CHB_PRIX),TRF-DATE_DEBUT 
from TJ_CHB_TRF

--6 Chambre réservées mais pas occupées--
select CHB_ID from TJ_CHB_PLN_CLI 
where CHB_PLN_CLI_RESERVE=1 and CHB_PLN_CLI_OCCUPE=0

--7 Taux de résa par chambre--
CREATE VIEW T_CHB_RES as SELECT CHB_ID,count(CHB_ID) as megaman 
from TJ_CHB_PLN_CLI  where ( CHB_PLN_CLI_RESERVE='1') 
group by (CHB_ID)

--8 Par qui ont été payées ces factures réglées en avance ? --
select CLI_NOM from T_CLIENT 
where CLI_ID in (select CLI_ID 
from T_FACTURE 
where FAC_DATE>FAC_PMT_DATE)

--9 Classement des modes de paiement (par le mode et le montant total généré)--

--10 Vous vous créez en tant que client de l'hôtel--

--11 Classement des clients par montant dépensé dans l'hôtel--

SELECT CLI_NOM,CHB_PLN_CLI_NB_PERS
from T_CLIENT as A,TJ_CHB_PLN_CLI as B 
where A.CLI_ID=B.CLI_ID 
order by CHB_PLN_CLI_NB_PERS

--12 Classement des occupations par trimestre
select count(CHB_PLN_CLI_OCCUPE),(cast(strftime('%m', PLN_JOUR) as integer) + 2) / 3 as Trimestre 
from TJ_CHB_PLN_CLI 
group by (cast(strftime('%m', PLN_JOUR) as integer) + 2) / 3

--13 Ne pas oublier vos moyens de communication--

--14 Facture réglées avant leur édition--
select FAC_ID from T_FACTURE 
where FAC_DATE>FAC_PMT_DATE

--15 Vous créez une nouvelle chambre à la date du jour--

--16 Vous serez 3 occupants et souhaitez le maximum de confort pour cette chambre dont le prix est 30% supérieur à la chambre la plus chère--

--17 Le réglement de votre facture sera effectuée en CB

--18 Une seconde facture a été éditée car le tarif a changé : rabais à 100%--

--19 Comment faites-vous ? (Ceci ne remplace pas les traitements précédents)--

--20 Classement des clients par montant dépensé dans l'hôtel--

SELECT CLI_NOM,CHB_PLN_CLI_NB_PERS
from T_CLIENT as A,TJ_CHB_PLN_CLI as B 
where A.CLI_ID=B.CLI_ID 
order by CHB_PLN_CLI_NB_PERS


