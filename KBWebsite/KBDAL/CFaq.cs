using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace KBDAL
{
   public class CFaq
    {
        #region Constructors
        public CFaq(){}
         
        public CFaq(int IDFaq,string Faqs,string Faqsans,DateTime Createddate,int Createduser,DateTime Updateddate,int Updateduser)
        {
            this.IDFaq = IDFaq;
            this.Faqs=Faqs;
            this.Faqsans=Faqsans;
            this.Createddate=Createddate;
            this.Createduser=Createduser;
            this.Updateddate=Updateddate;
            this.Updateduser=Updateduser;

        
        }
        #endregion
         #region Public Properties

        private int m_IDFaq;
        public int IDFaq
        {
            get { return m_IDFaq; }
            set { m_IDFaq = value; }
        }
        private string m_Faqs;
        public string Faqs
        {
            get{return m_Faqs;}
            set{m_Faqs=value;}
        }
       
        private string m_Faqsans;
        public string Faqsans
        {
            get{return m_Faqsans;}
            set{m_Faqsans=value;}
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
