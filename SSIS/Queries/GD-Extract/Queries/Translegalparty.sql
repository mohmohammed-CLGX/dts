SELECT  T.CntyCd, T.BatchDt, T.BatchSeq, T.TransId, T.MtgSeq
,TLPa.AddrHse1Nbr as [Mailing Address]
,TLPa.AddrSfx1Cd
,TLPa.AddrHse2Nbr
,TLPa.AddrSfx2Cd
,TLPa.AddrDirLeftCd
,TLPa.AddrStreetName
,TLPa.AddrModeCd
,TLPa.AddrAptNbr
,TLPa.StdAddr1
, TLPa.OrigCityName as [Mailing City]
, TLPa.OrigStCd as [Mailing State]
, TLPa.OrigZipCd as [Mailing Zip Code]
, TLPa.AddrCarrt as [Mailing Carrier Route]

FROM Trans.vTrans T 
left join Trans.vTransLegalParty TLPa on T.CntyCd=TLPa.CntyCd and T.BatchDt=TLPa.BatchDt and T.BatchSeq=TLPa.BatchSeq 
and T.TransId=TLPa.TransId and T.MtgSeq=TLPa.MtgSeq and TLPa.NameTypDesc in ('Buyer','Borrower','Owner')
left join Trans.vTransLegalParty TLPb on T.CntyCd=TLPb.CntyCd and T.BatchDt=TLPb.BatchDt and T.BatchSeq=TLPb.BatchSeq 
and T.TransId=TLPb.TransId and T.MtgSeq=TLPb.MtgSeq and TLPb.NameTypDesc in ('Seller', 'LienHolder','Plaintiff')
WHERE T.CntyCd = '01003' 
Order BY 1,2,3,4,5