using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace KBDAL
{
   public class CIssueType
    {
         
         #region Constructors
        public CIssueType(){}
        public CIssueType(int IDIssueType, string IssueType, string IssueTypeDescription, DateTime Createddate, int Createduser, DateTime Updateddate, int Updateduser)
        {
           this.IDIssueType=IDIssueType;
            this.IssueType=IssueType;
            this.IssueTypeDescription=IssueTypeDescription;
            this.Createddate=Createddate;
            this.Createduser=Createduser;
            this.Updateddate=Updateddate;
            this.Updateduser=Updateduser;

        
        }

         #endregion
        #region Public Properties

        private int m_IDIssueType;
        public int IDIssueType
        {
            get{return m_IDIssueType;}
            set{m_IDIssueType=value;}

        }
        private string m_IssueType;
        public string IssueType
        {
            get{return m_IssueType;}
            set{m_IssueType=value;}
        }
        private string m_IssueTypeDescription;
        public string IssueTypeDescription
        {
            get{return m_IssueTypeDescription;}
            set{m_IssueTypeDescription=value;}
        }
         private DateTime m_Createddate;
        public DateTime Createddate
        {
            get{return m_Createddate;}
            set{m_Createddate=value;}
        }
        
        private int m_Createduser;
        public int Createduser
        {
            get{return m_Createduser;}
            set{m_Createduser=value;}
        }
        private DateTime m_Updateddate;
        
        public DateTime Updateddate
        {
            get{return m_Updateddate;}
            set{m_Updateddate=value;}
        }
        private int m_Updateduser;
        public int Updateduser
        {
            get{return m_Updateduser;}
            set{m_Updateduser=value;}
        }
        #endregion
    }
}
