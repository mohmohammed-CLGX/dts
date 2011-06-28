using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace KBDAL
{
    interface Iissue
    {
    int IDIssue { get; set; }
	string FIPSCounty { get; set; }
    string State { get; set; }
    string County { get; set; }

	int IDProcessingType{ get; set; }
    string ProcessingType { get; set; }

	int IDFileType{ get; set; }
    string FileType { get; set; }

	int IDIssueType{ get; set; }
    string IssueType { get; set; }

	int Edition{ get; set; }
	int Version{ get; set; }
	string Title{ get; set; }
	string IssueDetails{ get; set; }
	string Resolution{ get; set; }
	string Submitter{ get; set; }
	string Relatedlink{ get; set; }
	int ICP{ get; set; }
	DateTime IssueCreatedDate{ get; set; }
	int IssueCreatedUser{ get; set; }
	DateTime IssueUpdatedDate{ get; set; }
	int IssueUpdatedUser{ get; set; }
	bool Isuplodedfile{ get; set; }
    int IDuploadedfile { get; set; }
    }
    interface Ifaq
    {
    int IDFaq{ get; set; }
	string Faqs{ get; set; }
	string Faqsans{ get; set; }
	DateTime Createddate{ get; set; }
	int Createduser{ get; set; }
	DateTime Updateddate{ get; set; }
	int Updateduser{ get; set; }
    }
    interface ICounty
    {
    string FIPS{ get; set; }
	string StateCounty{ get; set; }
	string State{ get; set; }
	string County{ get; set; }
    }
    interface Ifiletype
    {
    int IDFileType{ get; set; }
	string FileType{ get; set; }
	string FileTypeDescription{ get; set; }
	DateTime Createddate{ get; set; }
	int Createduser{ get; set; }
	DateTime Updateddate{ get; set; }
	int Updateduser{ get; set; }
    }
    interface IIssueType
    {
        int IDIssueType { get; set; }
        string IssueType { get; set; }
        string IssueTypeDescription { get; set; }
        DateTime Createddate { get; set; }
        int Createduser { get; set; }
        DateTime Updateddate { get; set; }
        int Updateduser { get; set; }
    }
    interface IProcessingTypetbl
    {
        int IDProcessingType { get; set; }
        string ProcessingType { get; set; }
        string ProcessingTypeDescription { get; set; }
        DateTime Createddate { get; set; }
        int Createduser { get; set; }
        DateTime Updateddate { get; set; }
        int Updateduser { get; set; }
    }
    
   
    
}
