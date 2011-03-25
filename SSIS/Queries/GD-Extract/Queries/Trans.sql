SELECT  T.CntyCd, T.BatchDt, T.BatchSeq, T.TransId, T.MtgSeq
,TPFi.AcctNbr as [Parcel Number]
,TSi.AddrHse1Nbr
,TSi.AddrSfx1Cd
,TSi.AddrStreetName
,TSi.AddrModeCd
,TSi.AddrDirLeftCd
,TSi.AddrAptNbr
,TL.LotId as [Lot Number]
,TLe.PortionLotInd as [Portion Indicator]
,TLe.UnitNbr as UNIT
,TLe.PlatMapBk as [Plat Book/Page]
,TLe.PlatMapPg
,TPFi.TractNbr as [TRACT NUMBER]
,TSi.AddrPfx1Cd+TSi.StdHse1Nbr+TSi.AddrSfx1Cd+'-'+TSi.AddrHse2Nbr+TSi.AddrSfx2Cd as 
[Full Situs House Number]
FROM Trans.vTrans T 
left join Trans.vTransPcrFields TPFi on T.CntyCd=TPFi.CntyCd AND 
T.BatchDt=TPFi.BatchDt AND T.BatchSeq=TPFi.BatchSeq 
AND T.TransId = TPFi.TransId AND T.MtgSeq=TPFi.MtgSeq
left join Trans.vTransLot TL on T.CntyCd=TL.CntyCd AND T.BatchDt=TL.BatchDt AND 
T.BatchSeq=TL.BatchSeq AND T.TransId=TL.TransId 
left join Trans.vTransSitus TSi on T.CntyCd=TSi.CntyCd and T.BatchDt=TSi.BatchDt and 
T.BatchSeq=TSi.BatchSeq 
and T.TransId=TSi.TransId and T.MtgSeq=TSi.MtgSeq and TSi.SitusSeq=1
left join Trans.vTransLegal TLe on T.CntyCd=TLe.CntyCd and T.BatchDt=TLe.BatchDt and 
T.BatchSeq=TLe.BatchSeq 
and T.TransId=TLe.TransId and t.MtgSeq=TLe.MtgSeq
WHERE T.CntyCd = '01003' 
Order BY 1,2,3,4,5