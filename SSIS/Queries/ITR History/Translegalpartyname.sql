SELECT T.CntyCd, T.BatchDt, T.BatchSeq, T.TransId, T.MtgSeq
, TLPNa.CorpInd as [CORPORATE INDICATOR]
, TLPNa.FullName AS [OWNER/BUYER NAME/DEFENDANT NAME]
, TLPNa.EtconInd as [OWNER ETAL IND]
, TLPNa.CareOfName as [C/O NAME]
, TLPNa.OwnrShipRightsCd as [OWNERSHIP RIGHTS CODE]
, TLPNa.RelTypCd as [OWNER RELATIONSHIP TYPE]
, TLPNi.FullName as [SELLER NAME/PLAINTIFF 1]
, TLPNk.CdVal as [MORTGAGE COMPANY CODE]
, TLPNb.CorpInd as [BUYER 2 CORP INDICATOR]
, TLPNc.CorpInd as [BUYER 3 CORP INDICATOR]
, TLPNd.CorpInd as [BUYER 4 CORP INDICATOR]
, TLPNe.FullName as [ATTORNEY NAME]
, TLPNa.PCTOwnrship as [BUYER1 % OWNERSHIP]
, TLPNb.FullName as [BUYER 2 NAME]
, TLPNb.OwnrShipRightsCd as [BUYER 2 OWNERSHIP RIGHTS CODE]
, TLPNb.RelTypCd as [BUYER 2 OWNER RELATIONSHIP TYPE]
, TLPNb.PCTOwnrship as [BUYER 2 % OWNERSHIP]
, TLPNc.FullName as [BUYER 3 NAME]
, TLPNc.OwnrShipRightsCd as [BUYER 3 OWNERSHIP RIGHTS CODE]
, TLPNc.RelTypCd as [BUYER 3 OWNER RELATIONSHIP TYPE]
, TLPNc.PCTOwnrship as [BUYER 3 % OWNERSHIP]
, TLPNd.FullName as [BUYER 4 NAME]
, TLPNd.OwnrShipRightsCd as [BUYER 4 OWNERSHIP RIGHTS CODE]
, TLPNd.RelTypCd as [BUYER 4 OWNER RELATIONSHIP TYPE]
, TLPNd.PCTOwnrship as [BUYER 4 % OWNERSHIP]
, TLPNj.FullName as [SELLER NAME/PLAINTIFF 2]
, TLPNi.CorpInd as [SELLER NAME/PLAINTIFF 1 CORP INDICATOR]
, TLPNj.CorpInd as [SELLER NAME/PLAINTIFF 2 CORP INDICATOR]
, TLPNi.CdVal as [SELLER CODE]
, TLPNc.FullName AS [TRUSTEE NAME]


FROM Trans.vTrans T 
left join Trans.vTransLegalPartyName TLPNa on T.CntyCd=TLPNa.CntyCd and T.BatchDt=TLPNa.BatchDt and T.BatchSeq=TLPNa.BatchSeq 
and T.TransId=TLPNa.TransId and T.MtgSeq=TLPNa.MtgSeq and TLPNa.NameSeq=1 and TLPNa.NameTypDesc in ('Buyer','Borrower','Owner')
left  join Trans.vTransLegalPartyName TLPNb on T.CntyCd=TLPNb.CntyCd and T.BatchDt=TLPNb.BatchDt and T.BatchSeq=TLPNb.BatchSeq 
and T.TransId=TLPNb.TransId and T.MtgSeq=TLPNb.MtgSeq and TLPNb.NameSeq=2 and TLPNb.NameTypDesc in ('Buyer','Borrower','Owner')
left join Trans.vTransLegalPartyName TLPNc on T.CntyCd=TLPNc.CntyCd and T.BatchDt=TLPNc.BatchDt and T.BatchSeq=TLPNc.BatchSeq 
and T.TransId=TLPNc.TransId and  T.MtgSeq=TLPNc.MtgSeq and TLPNc.NameSeq=3 and TLPNc.NameTypDesc in ('Buyer','Borrower','Owner')
left join Trans.vTransLegalPartyName TLPNd on T.CntyCd=TLPNd.CntyCd and T.BatchDt=TLPNd.BatchDt and T.BatchSeq=TLPNd.BatchSeq 
and T.TransId=TLPNd.TransId and T.MtgSeq=TLPNd.MtgSeq and TLPNd.NameSeq=4 and TLPNd.NameTypDesc in ('Buyer','Borrower','Owner')
left join Trans.vTransLegalPartyName TLPNe on T.CntyCd=TLPNe.CntyCd and T.BatchDt=TLPNe.BatchDt and T.BatchSeq=TLPNe.BatchSeq 
and T.TransId=TLPNe.TransId and T.MtgSeq=TLPNe.MtgSeq and TLPNe.NameSeq=1 and TLPNe.NameTypDesc ='Attorney'
left join Trans.vTransLegalPartyName TLPNi on T.CntyCd=TLPNi.CntyCd and T.BatchDt=TLPNi.BatchDt and T.BatchSeq=TLPNi.BatchSeq 
and T.TransId=TLPNi.TransId and T.MtgSeq=TLPNi.MtgSeq and TLPNi.NameSeq=1 and TLPNi.NameTypDesc in ('Seller', 'LienHolder','Plaintiff')
left join Trans.vTransLegalPartyName TLPNj on T.CntyCd=TLPNj.CntyCd and T.BatchDt=TLPNj.BatchDt and T.BatchSeq=TLPNj.BatchSeq 
and T.TransId=TLPNj.TransId and t.MtgSeq=TLPNj.MtgSeq and TLPNj.NameSeq=2 and TLPNj.NameTypDesc in ('Seller', 'LienHolder','Plaintiff')
left join Trans.vTransLegalPartyName TLPNk on T.CntyCd=TLPNk.CntyCd and T.BatchDt=TLPNk.BatchDt and T.BatchSeq=TLPNk.BatchSeq 
and T.TransId=TLPNk.TransId and T.MtgSeq=TLPNk.MtgSeq and TLPNk.NameSeq=1 and TLPNk.NameTypDesc in ('Lender', 'Assignee')

WHERE T.CntyCd = '01003' 
Order BY 1,2,3,4,5