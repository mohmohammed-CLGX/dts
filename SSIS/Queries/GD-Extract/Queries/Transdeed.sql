
SELECT  TD.CntyCd, TD.BatchDt, TD.BatchSeq, COALESCE(TL1.TransId,TD.TransId) as 

TransId, COALESCE(TL1.MtgSeq,T.MtgSeq) as MtgSeq
, TD.RecordingDt as [Document Date]
--,TD.SaleDt as [Document Date]
, TD.RecordingPage as [Book/Page]
, TD.DocNbr as [Document Number]
, TD.PclidIrisFrmtd as [Other ID]
--,TD.InputPclMatchKey as [Other ID]
,TD.ExciseTaxNbr as [Excise Number]
,TD.OwnrTransferPct as [Buyer Percent]--doubt
, TD.TaxStampAmt as [Transaction Tax]
, TD.SalePriceAmt as [Sale Price]
, TD.TaxStampAmtCd as [Stamp Amount Code]--Compare Flag
, TD.MultiSplitCd as [Multi Split Code]
, TD.TransTyp as [Seller Carry Back] 
, TD.DocTyp as [Deed Type]
, TD.TitleCompanyCd as [Title Company Tmp]--Title Company
, TL1.MtgDueDt as [Mortgage Due Date]
, TL1.MtgIntRateTyp as [Interest Rate Type]
, TL1.MtgAmt as [Mortgage Amount]
, TL1.SecMCEquityLoanInd as [Trust Position]
--, TL1.SecMCOtherSubordLoanInd as [Trust Position ]
, TD.EditCounter as [Edit Counter]
, TD.TitleOrderNbr as [Title Order Number]
, TD.TitleOrderAbbrev as [Title Order Abbreviation]
, TD.PrimaryCatCd as [Compare Flag]--review
, TL1.MtgLoanTypCd as [Private Party Lender 1 ] --Private Party Lender 2
, TD.TitleOrderAccomodationInd as [Accommodation Recording Flag]


FROM Trans.vTransDeed TD INNER JOIN Trans.vTrans T ON TD.CntyCd=T.CntyCd AND 

TD.BatchDt=T.BatchDt 
AND TD.BatchSeq=T.BatchSeq AND TD.TransId=T.TransId
left JOIN Trans.vTransLien TL1 ON T.CntyCd=TL1.CntyCd AND T.BatchDt=TL1.BatchDt AND 

T.BatchSeq=TL1.BatchSeq 
AND T.TransId=TL1.DeedTransId
WHERE TD.CntyCd = '01003'  and COALESCE(TL1.MtgSeq,T.MtgSeq)  < 5