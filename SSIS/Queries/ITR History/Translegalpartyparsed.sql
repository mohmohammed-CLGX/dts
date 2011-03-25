SELECT  T.CntyCd, T.BatchDt, T.BatchSeq, T.TransId, T.MtgSeq
, TLPPa.LastName as [LENDER LAST NAME]
, TLPPa.FirstName as [LENDER FIRST NAME]
, TLPPb.LastName as [BUYER LAST NAME (1)]
, TLPPb.FirstName as [BUYER FIRST NAME (1)]
, TLPPb.MiName as [BUYER MIDDLE INITIAL (1)]
, TLPPb.SfxId as [BUYER SUFFIX (1)]
, TLPPc.LastName as [BUYER LAST NAME (2)]
, TLPPc.FirstName as [BUYER FIRST NAME (2)]
, TLPPc.MiName as [BUYER MIDDLE INITIAL (2)]
, TLPPc.SfxId as [BUYER SUFFIX (2)]
, TLPPd.LastName as [BUYER LAST NAME (3)]
, TLPPd.FirstName as [BUYER FIRST NAME (3)]
, TLPPd.MiName as [BUYER MIDDLE INITIAL (3)]
, TLPPd.SfxId as [BUYER SUFFIX (3)]
, TLPPe.LastName as [BUYER LAST NAME (4)]
, TLPPe.FirstName as [BUYER FIRST NAME (4)]
, TLPPe.MiName as [BUYER MIDDLE INITIAL (4)]
, TLPPe.SfxId as [BUYER SUFFIX (4)]
, TLPPf.LastName AS [SELLER LAST NAME (1)]
, TLPPf.FirstName AS [SELLER FIRST NAME (1)]
, TLPPf.MiName AS [SELLER MIDDLE INITIAL (1)]
, TLPPf.SfxId AS [SELLER SUFFIX (1)]
, TLPPg.LastName AS [SELLER LAST NAME (2)]
, TLPPg.FirstName AS [SELLER FIRST NAME (2)]
, TLPPg.MiName AS [SELLER MIDDLE INITIAL (2)]
, TLPPg.SfxId AS [SELLER SUFFIX (2)]

FROM Trans.vTrans T 
left join Trans.vTransLegalPartyParsed TLPPa on T.CntyCd=TLPPa.CntyCd and T.BatchDt=TLPPa.BatchDt and T.BatchSeq=TLPPa.BatchSeq 
and T.TransId=TLPPa.TransId and T.MtgSeq=TLPPa.MtgSeq and TLPPa.NameSeq=1 and TLPPa.ParseSeq=1 and TLPPa.NameTypDesc ='Lender'
left join Trans.vTransLegalPartyParsed TLPPb on T.CntyCd=TLPPb.CntyCd and T.BatchDt=TLPPb.BatchDt and T.BatchSeq=TLPPb.BatchSeq 
and T.TransId=TLPPb.TransId and T.MtgSeq=TLPPb.MtgSeq and TLPPb.NameSeq=1 and TLPPb.ParseSeq=1 and TLPPb.NameTypDesc in ('Buyer','Borrower','Owner')
left join Trans.vTransLegalPartyParsed TLPPc on T.CntyCd=TLPPc.CntyCd and T.BatchDt=TLPPc.BatchDt and T.BatchSeq=TLPPc.BatchSeq 
and T.TransId=TLPPc.TransId and T.MtgSeq=TLPPc.MtgSeq and TLPPc.NameSeq=1 and TLPPc.ParseSeq=2 and TLPPc.NameTypDesc in ('Buyer','Borrower','Owner')
left join Trans.vTransLegalPartyParsed TLPPd on T.CntyCd=TLPPd.CntyCd and T.BatchDt=TLPPd.BatchDt and T.BatchSeq=TLPPd.BatchSeq 
and T.TransId=TLPPd.TransId and T.MtgSeq=TLPPd.MtgSeq and TLPPd.NameSeq=1 and TLPPd.ParseSeq=3 and TLPPd.NameTypDesc in ('Buyer','Borrower','Owner')
left join Trans.vTransLegalPartyParsed TLPPe on T.CntyCd=TLPPe.CntyCd and T.BatchDt=TLPPe.BatchDt and T.BatchSeq=TLPPe.BatchSeq 
and T.TransId=TLPPe.TransId and T.MtgSeq=TLPPe.MtgSeq and TLPPe.NameSeq=1 and TLPPe.ParseSeq=4 and TLPPe.NameTypDesc in ('Buyer','Borrower','Owner')
left join Trans.vTransLegalPartyParsed TLPPf on T.CntyCd=TLPPf.CntyCd and T.BatchDt=TLPPf.BatchDt and T.BatchSeq=TLPPf.BatchSeq 
and T.TransId=TLPPf.TransId and T.MtgSeq=TLPPf.MtgSeq and TLPPf.NameSeq=1 and TLPPf.ParseSeq=1 and TLPPf.NameTypDesc in ('Seller', 'LienHolder','Plaintiff')
left join Trans.vTransLegalPartyParsed TLPPg on T.CntyCd=TLPPg.CntyCd and T.BatchDt=TLPPg.BatchDt and T.BatchSeq=TLPPg.BatchSeq 
and T.TransId=TLPPg.TransId and T.MtgSeq=TLPPg.MtgSeq and TLPPg.NameSeq=1 and TLPPg.ParseSeq=2 and TLPPg.NameTypDesc in ('Seller', 'LienHolder','Plaintiff')


WHERE T.CntyCd = '01003' 
Order BY 1,2,3,4,5