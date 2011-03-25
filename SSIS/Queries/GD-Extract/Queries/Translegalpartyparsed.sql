SELECT  T.CntyCd, T.BatchDt, T.BatchSeq, T.TransId, T.MtgSeq
, TLPPa.LastName AS [Compare Flag]
FROM Trans.vTrans T 

left join Trans.vTransLegalPartyParsed TLPPa on T.CntyCd=TLPPa.CntyCd and 

T.BatchDt=TLPPa.BatchDt and T.BatchSeq=TLPPa.BatchSeq 
and T.TransId=TLPPa.TransId and T.MtgSeq=TLPPa.MtgSeq and TLPPa.NameSeq=1 and 

TLPPa.ParseSeq=1 and TLPPa.NameTypDesc in ('Buyer','Borrower','Owner')

WHERE T.CntyCd = '01003' 
Order BY 1,2,3,4,5