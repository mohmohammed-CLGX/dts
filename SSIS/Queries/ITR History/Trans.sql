SELECT  T.CntyCd, T.BatchDt, T.BatchSeq, T.TransId, T.MtgSeq
, TPFi.PclidUnvFrmtd as [APN (Parcel Number) (formatted)]
, TPFi.AcctNbr as [ACCOUNT NUMBER]
, TSi.AddrTypCd as [SITUS ADDRESS INDICATOR]
, TSi.AddrPfx1Cd as [SITUS HOUSE NUMBER PREFIX]
, TSi.AddrHse1Nbr as [SITUS HOUSE NUMBER]
, TSi.AddrSfx1Cd as [SITUS HOUSE NUMBER SUFFIX]
, TSi.AddrStreetName as [SITUS STREET NAME]
, TSi.AddrModeCd as [SITUS MODE]
,TSi.AddrDirLeftCd as [SITUS DIRECTION]
,TSi.AddrDirRightCd as [SITUS QUADRANT]
, TSi.AddrAptNbr as [SITUS APARTMENT UNIT]
, TSi.OrigCityName as [SITUS PROPERTY CITY]
, TSi.OrigStCd as [SITUS ROPERTY STATE]
, TSi.OrigZipCd as [SITUS PROPERTY ADDRESS ZIP CODE]
, TSi.AddrCarrt AS [SITUS CARRIER CODE]
, TPFi.PropIndCd as [PROPERTY INDICATOR CODE]
, TPFi.UnvBldgSqFtTotalNbr as [BUILDING SQUARE FEET]
, TSi.CensId as [CENSUS ID]
, TSi.LatDegr as LATITUDE
, TSi.LongDegr as [LONGITUDE]
, TSi.MatchCd as [SITUS MATCH CODE]
, TLe.SectionCd as [SECTION]
, TLe.TownshipCd as [TOWNSHIP]
, TLe.RangeCd as [RANGE]
, TL.LotId as LOT
, TLe.BlkInfo as BLOCK
, TLe.PortionLotInd as [PTN LOT INDICATOR]
, TLe.UnitNbr as UNIT
, TPFi.SubdPhase as PHASE
, TPFi.SubdSection as [SUBD SECTION]
, TLe.PlatMapBk as [PLAT/SUBD MAP BOOK]
, TLe.PlatMapPg as [PLAT/SUBD MAP PAGE]
, TLe.LegalMapTypCd as [MAP TYPE INDICATOR]
, TPFi.LegalText as [EXPANDED LEGAL]
, TPFi.TractNbr as [TRACT NUMBER]
, TLe.LandLotInfo as [LAND LOT]
, TPFi.IrisSecKey as [ALTERNATE APN  - IRIS SECONDARY]
, TPFi.UnvTotalValAmt as [ASSESSED VALUE - TOTAL]
, TPFi.UnvLandValTotal as [ASSESSED VALUE - LAND]
, TPFi.UnvImpvValTotal as [ASSESSED VALUE - IMPROVEMENT]
, TSi.AddrPfx1Cd+TSi.StdHse1Nbr+TSi.AddrSfx1Cd+'-'+TSi.AddrHse2Nbr+TSi.AddrSfx2Cd as [Full Situs House Number]
,TLe.StdSubdCd as [SUBDIVISION NAME]


FROM Trans.vTrans T 
left join Trans.vTransPcrFields TPFi on T.CntyCd=TPFi.CntyCd AND T.BatchDt=TPFi.BatchDt AND T.BatchSeq=TPFi.BatchSeq 
AND T.TransId = TPFi.TransId AND T.MtgSeq=TPFi.MtgSeq
left join Trans.vTransLot TL on T.CntyCd=TL.CntyCd AND T.BatchDt=TL.BatchDt AND T.BatchSeq=TL.BatchSeq AND T.TransId=TL.TransId 
left join Trans.vTransSitus TSi on T.CntyCd=TSi.CntyCd and T.BatchDt=TSi.BatchDt and T.BatchSeq=TSi.BatchSeq 
and T.TransId=TSi.TransId and T.MtgSeq=TSi.MtgSeq and TSi.SitusSeq=1
left join Trans.vTransLegal TLe on T.CntyCd=TLe.CntyCd and T.BatchDt=TLe.BatchDt and T.BatchSeq=TLe.BatchSeq 
and T.TransId=TLe.TransId and t.MtgSeq=TLe.MtgSeq

WHERE T.CntyCd = '01003' 
Order BY 1,2,3,4,5