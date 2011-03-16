SELECT  TOP 100
--, DataSupplierId  
--, DataSupplierId  
TD.MuncCd
, TLi.DistCd
, TLi.PclId
, TD.InputPclMatchKey
 , TD.OtherMatchInfo
, PclidUnvFrmtd
,TLi.PclSeqNbr
 ,AcctNbr 
, CorpInd
, FullName
, EtAlInd
,  EtconInd
, EtuxInd
, EtvirInd
,CareOfName
, OwnrShipRightsCd
, RelTypCd
, TLP.AddrPfx1Cd
,TLP.AddrHse1Nbr
, TS.AddrSfx1Cd
, TLP.AddrHse2Nbr
, TLP.AddrSfx2Cd
--, AddrDirLeftCd
, TLP.AddrStreetName
, TS.AddrModeCd
--, AddrDirRightCd
, TLP.AddrAptNbr
, TLP.OrigCityName
, TLP.StdCityName
, TLP.OrigStCd
, TLP.StdStCd
, TLP.OrigZipCd
, TLP.StdZipCd
, TLP.AddrCarrt
, TLP.MatchCd
, TS.AddrTypCd
, TPF.PcrOrigCityName
, PcrOrigStCd 
, PcrOrigZipCd
, T.BatchDt
, T.BatchSeq
, TLi.DocYyDt
, SalePriceAmt
, MtgAmt
, TLi.SaleDt
, TLi.RecordingDt
, TLi.DeedCatTyp
, TLi.StatisticalExclusion
,TLi.TransTyp
, TLi.DocNbr
, TLi.RecordingBook+TLi.RecordingPage as "BOOK/PAGE"  
 , CdVal
 , LastName
, FirstName
, TLP.StdAddr1
, TaxStampAmtCd
, TLi.DocTyp
--,[Filler]
,TLi.MultiSplitCd 
,TLi.MultiPropCnt
,TLi.TitleCompanyCd
, TLi.SecDCResModelInd
, MtgDt,MtgLoanTypCd
, MtgDocTyp
, MtgTermCd
, MtgTermAmt
, MtgDueDt
, MtgAssumpAmt
, MtgChangeAmt
, TLi.AbsenteeIrisCd
--,filler
,PropIndCd
, UnvBldgSqFtTotalNbr
-- , UnvBldgSqFtTotalNbr
, PartialInterestTransferInd
, OwnrTransferPct
, TLi.PrimaryCatCd
, MtgIntRateTyp
, TLi.TitleCompanyNm
, SecMCSellerCarriedLoanInd
, SecMCPrivatePartyLoanInd
, SecMCConstructionLoanInd
,TLi.SecDCResaleInd
, TLi.SecDCNewConstructionInd
, TLi.SecDCInterrelatedInd
, TLi.SecDCArmsLengthMortgageInd
, TLi.SecDCArmsLengthCashInd
, TLi.SecDCRealEstateOwnedInd
, SecMCRefinanceLoanInd
, SecMCEquityLoanInd
,TS.CensId
,TS.LatDegr
, TS.LongDegr
, TLi.CntyRgnId
--,filler
, MtgDocNbr
,MtgRecordingBook+MtgRecordingPage as "MORTGAGE BOOK/PAGE"
--,filler
, MtgIntRateCap
, PhoneNbr
, TLi.OrigRecordingDt
--,filler
--,filler
,OrigRecordingBook+OrigRecordingPage as "ORIGINAL BKPG"
,TLi.OrigDocNbr
, TLi.SourceInd
,TaxStampAmt
,TLi.SecDCRealEstateOwnedSaleInd
,SecMCOtherSubordLoanInd
, MtgSubordTyp
,TLi.ChronoNbr
,TL.UpdateTimestamp
, TLi.EditCounter
--,filler
,CaseNbr
--, AuctionDt 
--,LisPendensTyp  
--,filler
,TLi.PclMatchCd
, SectionCd
, TownshipCd
, RangeCd
,LotId
, LotSfxCd
, BlkInfo
, PortionLotInd
, UnitNbr
,SubdPhase
,SubdSection
,PlatMapBk
, PlatMapPg
, LegalMapTypCd
, LegalText
, TractNbr
, TLi.CntySectionCd
, LandLotInfo
, PCTOwnrship
, OrigName
, TLi.TitleOrderNbr
, TLi.TitleOrderAbbrev
, TLi.EscrowOrderNbr
, TLi.EscrowOrderAbbrev
, TLi.TimeshareOrderNbr
, TLi.TimeshareOrderAbbrev
, TLi.TitleOrderAccomodationInd
--,DefaultDt 
--,DefaultAmt
--,FirstMissedPaymentDt
,BeneficiaryPurchasedInd
--,filler
--,DocFilingDt
--,filler
--,AuctionTime  
--,AuctionAddr 
--,AuctionCityName 
--,AuctionStCd 
--,filler
--,FinalJudgmntAmt  
, TLi.OrigDocDt
,TLi.LandCourtDocNum
, TLi.CertificateNbr
, TLi.ExciseTaxNbr
,PropStatusCd
, CashDownAmt
--,filler
--,HpiValAmt[Not Found]
, MiName
, SfxId
, IrisFormatCd
, IrisName1
, IrisName2 
--,filler
, TLi.PclidIrisFrmtd 
, IrisSecKey
, UnvTotalValAmt
, UnvLandValTotal
, UnvImpvValTotal
--,filler
--,filler

Trans.vTrans T where T.cntycd='01003'
LEFT OUTER JOIN 
Trans.vTransDeed TD 
ON T.TransId = TD.TransId 
AND T.CntyCd = TD.CntyCd 
AND T.BatchDt = TD.BatchDt 
AND T.BatchSeq = TD.BatchSeq 
LEFT OUTER JOIN 
Trans.vTransLegalParty TLP 
ON T.TransId = TLP.TransId 
AND T.CntyCd = TLP.CntyCd 
AND T.BatchDt = TLP.BatchDt 
AND T.BatchSeq = TLP.BatchSeq 
AND T.MtgSeq = TLP.MtgSeq 
LEFT OUTER JOIN Trans.vTransLegalPartyName TLPN 
ON TLPN.TransId = TLP.TransId AND 
TLPN.CntyCd = TLP.CntyCd 
AND TLPN.BatchDt = TLP.BatchDt 
AND TLPN.BatchSeq = TLP.BatchSeq 
AND TLPN.MtgSeq = TLP.MtgSeq 
LEFT OUTER JOIN Trans.vTransLien TLi 
ON T.TransId = TLi.TransId 
AND T.CntyCd = TLi.CntyCd 
AND T.BatchDt = TLi.BatchDt 
AND T.BatchSeq = TLi.BatchSeq 
AND T.MtgSeq = TLi.MtgSeq 
LEFT OUTER JOIN 
Trans.vTransLegal TLe 
ON T.TransId = TLe.TransId 
AND T.CntyCd = TLe.CntyCd 
AND T.BatchDt = TLe.BatchDt 
AND T.BatchSeq = TLe.BatchSeq 
AND T.MtgSeq = TLe.MtgSeq 
LEFT OUTER JOIN 
Trans.vTransPcrFields TPF 
ON T.TransId = TPF.TransId 
AND T.CntyCd = TPF.CntyCd 
AND T.BatchDt = TPF.BatchDt 
AND T.BatchSeq = TPF.BatchSeq 
AND T.MtgSeq = TPF.MtgSeq 
LEFT OUTER JOIN 
Trans.vTransSitus TS 
ON T.TransId = TS.TransId 
AND T.CntyCd = TS.CntyCd 
AND T.BatchDt = TS.BatchDt 
AND T.BatchSeq = TS.BatchSeq 
AND T.MtgSeq = TS.MtgSeq 
LEFT OUTER JOIN 
Trans.vTransLegalPartyOrigName TLPON
ON TLPON.TransId = TLP.TransId 
AND TLPON.CntyCd = TLP.CntyCd 
AND TLPON.BatchDt = TLP.BatchDt 
AND TLPON.BatchSeq = TLP.BatchSeq 
AND TLPON.MtgSeq = TLP.MtgSeq 
LEFT OUTER JOIN 
Trans.vTransLegalPartyParsed TLPP 
ON T.TransId = TLPP.TransId 
AND T.CntyCd = TLPP.CntyCd 
AND T.BatchDt = TLPP.BatchDt 
AND T.BatchSeq = TLPP.BatchSeq 
AND T.MtgSeq = TLPP.MtgSeq 
LEFT OUTER JOIN 
Trans.vTransLot TL 
ON T.TransId = TL.TransId 
AND T.CntyCd = TL.CntyCd 
AND T.BatchDt = TL.BatchDt
 AND T.BatchSeq = TL.BatchSeq 
AND T.MtgSeq = TL.MtgSeq
