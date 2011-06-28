using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace KBDAL
{
   public class CProcessingType
    {
       
         #region Constructors
        public CProcessingType(){}
        public CProcessingType(int IDProcessingType, string ProcessingType, string ProcessingTypeDescription, DateTime Createddate, int Createduser, DateTime Updateddate, int Updateduser)
        {
           this.IDProcessingType=IDProcessingType;
            this.ProcessingType=ProcessingType;
            this.ProcessingTypeDescription=ProcessingTypeDescription;
            this.Createddate=Createddate;
            this.Createduser=Createduser;
            this.Updateddate=Updateddate;
            this.Updateduser=Updateduser;

        
        }

         #endregion
        #region Public Properties

        private int m_IDProcessingType;
        public int IDProcessingType
        {
            get{return m_IDProcessingType;}
            set{m_IDProcessingType=value;}

        }
        private string m_ProcessingType;
        public string ProcessingType
        {
            get{return m_ProcessingType;}
            set{m_ProcessingType=value;}
        }
        private string m_ProcessingTypeDescription;
        public string ProcessingTypeDescription
        {
            get{return m_ProcessingTypeDescription;}
            set{m_ProcessingTypeDescription=value;}
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
