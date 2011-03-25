
SELECT TPfc.CntyCd, TPfc.BatchDt, TPfc.BatchSeq, TPfc.TransId, T.MtgSeq
, TPfc.RecordingDt as [Document Date]
--,TPfc.SaleDt as [Document Date]
, TPfc.RecordingPage as [Book/Page]
, TPfc.DocNbr as [Document Number]
, TPfc.PclidIrisFrmtd as [Other ID]
--,TPfc.InputPclMatchKey as [Other ID]
,TPfc.ExciseTaxNbr as [Excise Number]
, TPfc.MultiSplitCd as [Multi Split Code]
 , TPfc.DocTyp as [Deed Type]
, TPfc.TitleCompanyCd as [Title Company Tmp]--Title Company
, TPfc.EditCounter as [Edit Counter]
, TPfc.TitleOrderNbr as [Title Order Number]
, TPfc.TitleOrderAbbrev as [Title Order Abbreviation]
, TPfc.PrimaryCatCd as [Compare Flag]--review
,TPfc.SelCarryCd as [Seller Carry Back] --check
, TPfc.TitleOrderAccomodationInd as [Accommodation Recording Flag]
FROM Trans.vTransPreForeClosure TPfc INNER JOIN Trans.vTrans T 
ON TPfc.CntyCd=T.CntyCd 
AND TPfc.BatchDt=T.BatchDt 
AND TPfc.BatchSeq=T.BatchSeq 
AND TPfc.TransId=T.TransId
where TPfc.CntyCd='01003'