using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace KBDAL
{
   public class CFileType
    {
        

        #region Constructors
        public CFileType(){}
       public CFileType(int IDFileType,string FileType,string FileTypeDescription,DateTime Createddate,int Createduser,DateTime Updateddate,int Updateduser)
        {
           this.IDFileType=IDFileType;
            this.FileType=FileType;
            this.FileTypeDescription=FileTypeDescription;
            this.Createddate=Createddate;
            this.Createduser=Createduser;
            this.Updateddate=Updateddate;
            this.Updateduser=Updateduser;

        
        }

         #endregion
        #region Public Properties

        private int m_IDFileType;
        public int IDFileType
        {
            get{return m_IDFileType;}
            set{m_IDFileType=value;}

        }
        private string m_FileType;
        public string FileType
        {
            get{return m_FileType;}
            set{m_FileType=value;}
        }
        private string m_FileTypeDescription;
        public string FileTypeDescription
        {
            get{return m_FileTypeDescription;}
            set{m_FileTypeDescription=value;}
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
