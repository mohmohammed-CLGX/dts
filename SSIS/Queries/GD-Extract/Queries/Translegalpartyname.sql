SELECT T.CntyCd, T.BatchDt, T.BatchSeq, T.TransId, T.MtgSeq
, TLPNa.FullName AS [Buyer Name]
, TLPNa.PCTOwnrship as [Buyer Percent]
,TLPNb.FullName as [Additional Buyer Name]
,TLPNc.FullName as [Seller]
, TLPNa.OwnrShipRightsCd
, TLPNa.RelTypCd as [Vesting Code]
, TLPNd.CdVal as [Lender Code]
,TLPNe.CdVal as [Lender Code 2]

FROM Trans.vTrans T 
left join Trans.vTransLegalPartyName TLPNa on T.CntyCd=TLPNa.CntyCd and T.BatchDt=TLPNa.BatchDt and T.BatchSeq=TLPNa.BatchSeq 
and T.TransId=TLPNa.TransId and T.MtgSeq=TLPNa.MtgSeq and TLPNa.NameSeq=1 and TLPNa.NameTypDesc in ('Buyer','Borrower','Owner')
left  join Trans.vTransLegalPartyName TLPNb on T.CntyCd=TLPNb.CntyCd and T.BatchDt=TLPNb.BatchDt and T.BatchSeq=TLPNb.BatchSeq 
and T.TransId=TLPNb.TransId and T.MtgSeq=TLPNb.MtgSeq and TLPNb.NameSeq=2 and TLPNb.NameTypDesc in ('Buyer','Borrower','Owner')
left join Trans.vTransLegalPartyName TLPNc on T.CntyCd=TLPNc.CntyCd and T.BatchDt=TLPNc.BatchDt and T.BatchSeq=TLPNc.BatchSeq 
and T.TransId=TLPNc.TransId and T.MtgSeq=TLPNc.MtgSeq and TLPNc.NameSeq=1 and TLPNc.NameTypDesc in ('Seller','LienHolder','Plaintiff')
left join Trans.vTransLegalPartyName TLPNd on T.CntyCd=TLPNd.CntyCd and T.BatchDt=TLPNd.BatchDt and T.BatchSeq=TLPNd.BatchSeq 
and T.TransId=TLPNd.TransId and T.MtgSeq=TLPNd.MtgSeq and TLPNd.NameSeq=1 and TLPNd.NameTypDesc in ('Lender','Assignee')
left join Trans.vTransLegalPartyName TLPNe on T.CntyCd=TLPNe.CntyCd and T.BatchDt=TLPNe.BatchDt and T.BatchSeq=TLPNe.BatchSeq 
and T.TransId=TLPNe.TransId and T.MtgSeq=TLPNe.MtgSeq and TLPNe.NameSeq=2 and TLPNe.NameTypDesc in ('Lender', 'Assignee')
WHERE T.CntyCd = '01003' 
Order BY 1,2,3,4,5