SELECT  CommentTypetbl.CommentType,  County.StateCounty, FileType.FileType, Issuetbl.FIPSCounty, 
 IssueTypetbl.IssueType, Issuetbl.IssueDescription, Issuetbl.IssueResolution, Issuetbl.IssueCreatedDate, Issuetbl.IssueCreatedUser 
 FROM CommentTypetbl INNER JOIN CommentTypetbl AS CommentTypetbl_1 ON CommentTypetbl.IDCommentType = CommentTypetbl_1.IDCommentType 
full JOIN Issuetbl ON CommentTypetbl.IDCommentType = Issuetbl.IDCommentType AND CommentTypetbl_1.IDCommentType = Issuetbl.IDCommentType 
 full JOIN County ON Issuetbl.FIPSCounty = County.FIPS INNER JOIN FileType ON Issuetbl.IDFileType = FileType.IDFileType 
 full JOIN IssueTypetbl ON Issuetbl.IDIssueType = IssueTypetbl.IssueType_ID
               