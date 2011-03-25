SELECT  T.CntyCd, T.BatchDt, T.BatchSeq, T.TransId, T.MtgSeq
,TLPa.AddrDirLeftCd as [STREET DIRECTION]
,TLPa.AddrDirRightCd as [BUYER QUADRANT]
, TLPa.AddrPfx1Cd as [BUYER HOUSE NUMBER PREFIX]
, TLPa.AddrHse1Nbr as [BUYER HOUSE NUMBER]
, TLPa.AddrSfx1Cd as [BUYER HOUSE NUMBER SUFFIX]
, TLPa.AddrStreetName as [BUYER STREET NAME]
, TLPa.AddrModeCd as [BUYER MODE]
, TLPa.AddrAptNbr as [BUYER APARTMENT UNIT]
, TLPa.OrigCityName as [BUYER MAILING CITY]
, TLPa.OrigStCd as [BUYER MAILING STATE]
, TLPa.OrigZipCd as [BUYER MAILING ZIP CODE]
, TLPa.AddrCarrt as [BUYER CARRIER CODE]
, TLPa.MatchCd as [BUYER MATCH CODE]
, TLPe.StdAddr1 as [LENDER ADDRESS]
, TLPe.OrigCityName as [LENDER CITY]
, TLPe.OrigStCd as [LENDER STATE]
, TLPe.OrigZipCd as [LENDER ZIP]
, TLPa.PhoneNbr as [BUYER PHONE NUMBER]
, TLPd.PhoneNbr as [ATTORNEY PHONE]
, TLPe.PhoneNbr as [LENDER PHONE NUMBER]
, TLPc.StdAddr1 as [TRUSTEE MAILING ADDRESS]
, TLPc.OrigCityName as [TRUSTEE MAILING CITY]
, TLPc.OrigStCd as [TRUSTEE MAILING STATE]
, TLPc.OrigZipCd as [TRUSTEE MAILING ZIP CODE]
, TLPc.PhoneNbr as [TRUSTEE PHONE NUMBER]
, TLPa.IrisFormatCd as [Win2Data BUYER CODE]
, TLPa.IrisName1 as [Win2Data BUYER NAME 1]
, TLPa.IrisName2 as [Win2Data BUYER NAME 2]--442320
, TLPa.AddrPfx1Cd+TLPa.AddrHse1Nbr+TLPa.AddrSfx1Cd+'-'+TLPa.AddrHse2Nbr+TLPa.AddrSfx2Cd as [Full Mailing House Number]


FROM Trans.vTrans T 

left join Trans.vTransLegalParty TLPa on T.CntyCd=TLPa.CntyCd and T.BatchDt=TLPa.BatchDt and T.BatchSeq=TLPa.BatchSeq 
and T.TransId=TLPa.TransId and T.MtgSeq=TLPa.MtgSeq and TLPa.NameTypDesc in ('Buyer','Borrower','Owner')
left join Trans.vTransLegalParty TLPb on T.CntyCd=TLPb.CntyCd and T.BatchDt=TLPb.BatchDt and T.BatchSeq=TLPb.BatchSeq 
and T.TransId=TLPb.TransId and T.MtgSeq=TLPb.MtgSeq and TLPb.NameTypDesc in ('Seller', 'LienHolder','Plaintiff')
left join Trans.vTransLegalParty TLPc on T.CntyCd=TLPc.CntyCd and T.BatchDt=TLPc.BatchDt and T.BatchSeq=TLPc.BatchSeq 
and T.TransId=TLPc.TransId and  T.MtgSeq=TLPc.MtgSeq and TLPc.NameTypDesc = 'Trustee'
left join Trans.vTransLegalParty TLPd on T.CntyCd=TLPd.CntyCd and T.BatchDt=TLPd.BatchDt and T.BatchSeq=TLPd.BatchSeq 
and T.TransId=TLPd.TransId and T.MtgSeq=TLPd.MtgSeq and TLPd.NameTypDesc = 'Attorney'
left join Trans.vTransLegalParty TLPe on T.CntyCd=TLPe.CntyCd and T.BatchDt=TLPe.BatchDt and T.BatchSeq=TLPe.BatchSeq 
and T.TransId=TLPe.TransId and T.MtgSeq=TLPe.MtgSeq and TLPe.NameTypDesc in ('Lender', 'Assignee')

WHERE T.CntyCd = '01003' 
Order BY 1,2,3,4,5