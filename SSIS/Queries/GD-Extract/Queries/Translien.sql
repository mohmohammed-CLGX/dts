SELECT TLi.CntyCd, TLi.BatchDt, TLi.BatchSeq, TLi.TransId, TLi.MtgSeq 
, TLi.RecordingDt as [Document Date]
--,TLi.SaleDt as [Document Date]
, TLi.RecordingPage as [Book/Page]
, TLi.DocNbr as [Document Number]
, TLi.PclidIrisFrmtd as [Other ID]
--,TLi.InputPclMatchKey as [Other ID]
,TLi.ExciseTaxNbr as [Excise Number]
,TLi.StndAloneMtgInd as Filler---check
, TLi.MultiSplitCd as [Multi Split Code]
, TLi.TransTyp as [Seller Carry Back] 
,TLi.SecMCPrivatePartyLoanInd  --Mortgage Type
,TLi.SecMCConstructionLoanInd  --Mortgage Type
,TLi.SecMCRefinanceLoanInd  --Mortgage Type
,TLi.SecMCEquityLoanInd  --Mortgage Type
,TLi.SecMCOtherSubordLoanInd  --Mortgage Type
,TLi.SecMCConformingLoanInd--Mortgage Type
,TLi.SecMCConventionalLoanInd--Mortgage Type
,TLi.SecMCFhaLoanInd--Mortgage Type
,TLi.SecMCFixedRateLoanInd--Mortgage Type
,TLi.SecMCNonConformingLoanInd--Mortgage Type
,TLi.SecMCSmallBusAssocLoanInd--Mortgage Type
,TLi.SecMCVaLoanInd--Mortgage Type
,TLi.SecMCVariableRateLoanInd--Mortgage Type
, TLi.DocTyp as [Deed Type]
, TLi.MtgAmt as [Mortgage Amount]
, TLi.TitleCompanyCd as [Title Company Tmp]--Title Company
, TLi.MtgDueDt as [Mortgage Due Date]
, TLi.MtgIntRateTyp as [Interest Rate Type]
,TLi.MtgIntRatePct as [Interest Rate]--check
, TLi.EditCounter as [Edit Counter]
, TLi.TitleOrderNbr as [Title Order Number]
, TLi.TitleOrderAbbrev as [Title Order Abbreviation]
, TLi.PrimaryCatCd as [Compare Flag]--review
, TLi.MtgLoanTypCd as [Private Party Lender 1 ] --Private Party Lender 2
, TLi.TitleOrderAccomodationInd as [Accommodation Recording Flag]


FROM Trans.vTransLien TLi
WHERE TLi.CntyCd = '01003' AND Tli.DeedTransId IS NULL