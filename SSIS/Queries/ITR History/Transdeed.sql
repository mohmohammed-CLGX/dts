SELECT  TD.CntyCd, TD.BatchDt, TD.BatchSeq, COALESCE(TL1.TransId,TD.TransId) as TransId, COALESCE(TL1.MtgSeq,T.MtgSeq) as MtgSeq
, TD.MuncCd as [MUNICIPALITY CODE]
, TD.PclId as [APN (Parcel Number)]
, TD.PclSeqNbr as [APN SEQUENCE NUMBER]
,TD.BatchDt AS   [BATCH-DT]
,TD.BatchSeq AS [BATCH-SEQ]
, TD.DocYyDt as [DOCUMENT YEAR]
, TD.SalePriceAmt as [SALE AMOUNT]
, TL1.MtgAmt as [MORTGAGE AMOUNT]
, TD.SaleDt as [SALE DATE  (YYYYMMDD)]
, TD.RecordingDt as [RECORDING DATE  (YYYYMMDD)]
, TD.DeedCatTyp as [DOCUMENT TYPE]
, TD.TransTyp as [TRANSACTION TYPE]
, TD.DocNbr as [DOCUMENT NUMBER]
, TD.RecordingBook + TD.RecordingPage as [BOOK/PAGE  (6x6)]
, TD.TaxStampAmtCd as [SALE CODE]
, TD.DocTyp as [DETAILED DOCUMENT TYPE]
, TD.MultiSplitCd as [MULTI APN]
, TD.MultiPropCnt as [MULTI APN COUNT]
, TD.TitleCompanyCd as [TITLE COMPANY CODE]
, TD.SecDCResModelInd as [RESIDENTIAL MODEL INDICATOR]
, TL1.MtgDt as [MORTGAGE DATE]
, TL1.MtgLoanTypCd as [MORTGAGE LOAN TYPE CODE]
, TL1.MtgDocTyp as [MORTGAGE DEED TYPE]
, TL1.MtgTermCd as [MORTGAGE TERM CODE]
, TL1.MtgTermAmt as [MORTGAGE TERM]
, TL1.MtgDueDt as [MORTGAGE DUE DATE]
, TL1.MtgAssumpAmt as [MORTGAGE ASSUMPTION AMOUNT]
, TL1.MtgChangeAmt as [MORTGAGE CHANGE AMOUNT]
, TD.AbsenteeIrisCd as [ABSENTEE INDICATOR]
, TD.PartialInterestTransferInd as [PARTIAL INTEREST INDICATOR]
, TD.OwnrTransferPct as [OWNERSHIP TRANSFER PERCENTAGE]
, TD.PrimaryCatCd as [PRI-CAT-CODE]
, TL1.MtgIntRateTyp as [MORTGAGE INTEREST RATE TYPE]
, TD.TitleCompanyNm as [TITLE COMPANY NAME]
, TL1.SecMCSellerCarriedLoanInd as [SELLER CARRY BACK ('Y')]
, TL1.SecMCPrivatePartyLoanInd as [PRIVATE PARTY LENDER ('Y')]
, TL1.SecMCConstructionLoanInd as [CONSTRUCTION LOAN ('Y')]
, TL1.SecDCResaleInd as [RESALE/NEW CONSTRUCTION]
, TL1.SecDCInterrelatedInd as [INTER FAMILY ('Y')]
, TL1.SecDCArmsLengthMortgageInd as [CASH/MORTGAGE PURCHASE]
, TL1.SecDCRealEstateOwnedInd as [FORCLOSURE ('Y')]
, TL1.SecMCRefinanceLoanInd as [REFI FLAG ('Y')]
, TL1.SecMCEquityLoanInd as [EQUITY FLAG ('Y')]
, TD.CntyRgnId as [County Region ID]
, TL1.MtgDocNbr as [MORTGAGE DOCUMENT NUMBER]
, TL1.MtgRecordingBook+TL1.MtgRecordingPage as [MORTGAGE BOOK/PAGE  (6x6)]
, TL1.MtgIntRateCap as [MORTGAGE INTEREST RATE]
, TD.OrigRecordingDt as [ORIGINAL RECORDED DATE]
, TD.OrigRecordingBook+TD.OrigRecordingPage as [ORIGINAL BKPG]
, TD.OrigDocNbr as [ORIGINAL DOC NUMBER]
, TD.SourceInd as [SALES SOURCE INDICATOR]
, TD.TaxStampAmt as [DOC TRANSFER TAX]
, TL1.SecDCRealEstateOwnedSaleInd as [REO SALE]
, TL1.SecMCOtherSubordLoanInd as [OTHER SUBORDINATE LOANS]
, TL1.MtgSubordTyp as [RMS EQUITY FLAG TYPE]
, TD.ChronoNbr as [CHRONOLOGY NUMBER]
, TD.UpdateTimestamp as [TIMESTAMP DATE]
, TD.UpdateTimestamp as [TIMESTAMP TIME]
, TD.EditCounter as [RECORD TYPE - ADD, CHANGE, DELETE]
, TD.CaseNbr as [COURT CASE #]
, TD.PclMatchCd as [PARCEL FILE MATCH CODE]
, TD.DistCd as [DISTRICT CODE]
, TD.CntySectionCd as SECTION
, TD.TitleOrderNbr as [TITLE ORDER NUMBER]
, TD.TitleOrderAbbrev as [TITLE ORDER ABBREVIATION]
, TD.EscrowOrderNbr as [ESCROW ORDER NUMBER]
, TD.EscrowOrderAbbrev as [ESCROW ORDER ABBREVIATION]
, TD.TimeshareOrderNbr as [TIMESHARE/TRUSTEES ORDER (SALE) NUMBER]
, TD.TimeshareOrderAbbrev as [TIMESHARE/TRUSTEES SALE ABBREVIATION]
, TD.TitleOrderAccomodationInd as [ACCOMMODATION RECORDING FLAG]
, TD.BeneficiaryPurchasedInd as [GRANTEE THE FORECLOSING BENEFICIARY]
, TD.OrigDocDt as [RECORDING DATE OF ORIGINAL MTG]
, TD.LandCourtDocNum as [HAWAII LAND COURT DOCUMENT NUMBER]
, TD.CertificateNbr as [HAWAII TCT/CERTIFICATE NUMBER]
, td.ExciseTaxNbr as [WA EXCISE NUMBER]
, TD.PropStatusCd as [AZ EXEMPTION SUFFIX]
, TD.PropStatusCd as [AZ EXEMPTION PREFIX]
, TD.CashDownAmt as [Cash Down Amount]
, TD.PclidIrisFrmtd as [APN PARCEL NUMBER FORMATTED - IRIS]
,TD.AvmValAmt as [HPI VALUE AMT ]
,TD.DocFilingDt as [FILING DATE]
,TD.AuctionAddr as [STREET ADDRESS OF AUCTION CALL]
,TD.AuctionCityName as [CITY OF AUCTION CALL]
,TD.FinalJudgmntAmt as [UNPAID BALANCE (FINAL JUDGMENT AMT)]

FROM Trans.vTransDeed TD INNER JOIN Trans.vTrans T ON TD.CntyCd=T.CntyCd AND TD.BatchDt=T.BatchDt 
AND TD.BatchSeq=T.BatchSeq AND TD.TransId=T.TransId
left JOIN Trans.vTransLien TL1 ON T.CntyCd=TL1.CntyCd AND T.BatchDt=TL1.BatchDt AND T.BatchSeq=TL1.BatchSeq 
AND T.TransId=TL1.DeedTransId
WHERE TD.CntyCd = '01003'  and COALESCE(TL1.MtgSeq,T.MtgSeq)  < 5