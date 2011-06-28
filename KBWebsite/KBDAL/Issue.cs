using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace KBDAL
{
    public class CIssue 
    {
       #region Constructors
        public CIssue()
        {

        }

        public CIssue(int IDIssue, string FIPSCounty, string State, string County, int IDProcessingType, string ProcessingType,
            int IDFileType, string FileType, int IDIssueType, string IssueType, int Edition, int Version,string Title,string IssueDetails,
            string Resolution,string Submitter,int ICP,DateTime IssueCreatedDate,int IssueCreatedUser,DateTime IssueUpdatedDate,
        int IssueUpdatedUser,bool Isuplodedfile,int IDuploadedfile)
        {
            this.IDIssue = IDIssue;
            this.FIPSCounty = FIPSCounty;
            this.State = State;
            this.County = County;
            this.IDProcessingType = IDProcessingType;
            this.ProcessingType = ProcessingType;
            this.IDFileType=IDFileType;
            this.FileType = FileType;
            this.IDIssueType=IDIssueType;
            this.IssueType = IssueType;
            this.Edition = Edition;
            this.Version = Version;
            this.Title = Title;
            this.IssueDetails = IssueDetails;
            this.Resolution = Resolution;
            this.Submitter = Submitter;
            this.ICP = ICP;
            this.IssueCreatedDate = IssueCreatedDate;
            this.IssueCreatedUser = IssueCreatedUser;
            this.IssueUpdatedDate = IssueUpdatedDate;
            this.IssueUpdatedUser = IssueUpdatedUser;
            this.Isuplodedfile = Isuplodedfile;
            this.IDuploadedfile = IDuploadedfile;

        }

        #endregion

        #region Public Properties
        private int mIDIssue;
        public int IDIssue
        {
            get{return mIDIssue;}
            set { mIDIssue = value; }
        }
       
        private  string mFIPSCounty;
        public string FIPSCounty
        {
            get { return mFIPSCounty; }
            set { mFIPSCounty = value; }
        }
        private string mState;
        public string State
        {
            get { return mState; }
            set { mState = value; }
        }
        private string mCounty;
        public string County
        {
            get { return mCounty; }
            set { mCounty = value; }
        }
          private int mIDProcessingType;
        public int IDProcessingType
        {
            get { return mIDProcessingType; }
            set { mIDProcessingType = value; }
        }
        private string mProcessingType;
        public string ProcessingType
        {
            get { return mProcessingType; }
            set { mProcessingType = value; }
        }
       

        private int mIDFileType;
        public int IDFileType
        {
            get { return mIDFileType; }
            set { mIDFileType = value; }
        }
        private string mFileType;
        public string FileType
        {
            get { return mFileType; }
            set { mFileType = value; }
        }
       
        private int mIDIssueType;
        public int IDIssueType
        {
            get { return mIDIssueType; }
            set { mIDIssueType = value; }
        }
        private string mIssueType;
        public string IssueType
        {
            get { return mIssueType; }
            set { mIssueType = value; }
        }
       
        private int mEdition;
        public int Edition
        {
            get { return mEdition; }
            set { mEdition = value; }
        }
        private int mVersion;
        public int Version
        {
            get { return mVersion; }
            set { mVersion = value; }
        }
        private string mTitle;
        
            public string Title
        {
            get { return mTitle; }
            set { mTitle = value; }
        }
        private string mIssueDetails;
        public string IssueDetails
        {
            get { return mIssueDetails; }
            set { mIssueDetails = value; }
        }
        private string mResolution;
        public string Resolution
        {
            get { return mResolution; }
            set { mResolution = value; }
        }
        private string mSubmitter;
        public string Submitter
        {
            get { return mSubmitter; }
            set { mSubmitter = value; }
        }
        private string mRelatedlink;
        public string Relatedlink
        {
            get { return mRelatedlink; }
            set { mRelatedlink = value; }
        }
        private int mICP;
        public int ICP
        {
            get { return mICP; }
            set { mICP = value; }
        }
        private DateTime mIssueCreatedDate;
        public DateTime IssueCreatedDate
        {
            get { return mIssueCreatedDate; }
            set { mIssueCreatedDate = value; }
        }
        private int mIssueCreatedUser;
        public int IssueCreatedUser
        {
            get { return mIssueCreatedUser; }
            set { mIssueCreatedUser = value; }
        }
        private DateTime mIssueUpdatedDate;
        public DateTime IssueUpdatedDate
        {
            get { return mIssueUpdatedDate; }
            set { mIssueUpdatedDate = value; }
        }
        private int mIssueUpdatedUser;
        public int IssueUpdatedUser
        {
            get { return mIssueUpdatedUser; }
            set { mIssueUpdatedUser = value; }
        }
        private bool mIsuplodedfile;
        public bool Isuplodedfile
        {
            get { return mIsuplodedfile; }
            set { mIsuplodedfile = value; }
        }
        private int mIDuploadedfile;
        public int IDuploadedfile
        {
            get { return mIDuploadedfile; }
            set { mIDuploadedfile = value; }
        }

        #endregion
    }

    
}
