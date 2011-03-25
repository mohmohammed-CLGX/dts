SELECT TInLi.CntyCd, TInLi.BatchDt, TInLi.BatchSeq, TInLi.TransId, TInLi.MtgSeq
, TInLi.RecordingDt as [Document Date]
--,TInLi.SaleDt as [Document Date]
, TInLi.RecordingPage as [Book/Page]
, TInLi.DocNbr as [Document Number]
, TInLi.PclidIrisFrmtd as [Other ID]
--,TInLi.InputPclMatchKey as [Other ID]
,TInLi.TaxStampAmtCd as [Stamp Amount Code]
, TInLi.MultiSplitCd as [Multi Split Code]
, TInLi.TransTyp as [Seller Carry Back] 
, TInLi.DocTyp as [Deed Type]
,TInLi.MtgIntRatePct as [Interest Rate]--check
, TInLi.TitleCompanyCd as [Title Company Tmp]--Title Company
, TInLi.EditCounter as [Edit Counter]
, TInLi.PrimaryCatCd as [Compare Flag]--review
, TInLi.TitleOrderAccomodationInd as [Accommodation Recording Flag]



FROM Trans.vTransInvoluntaryLien TInLi
WHERE TInLi.CntyCd = '01003'