using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace KBDAL
{
   public class CCounty
    {
        #region Constructors
        public CCounty(){ }
        public CCounty(string FIPS,string StateCounty,string State,string County)
    {
            this.FIPS=FIPS;
            this.StateCounty=StateCounty;
            this.State=State;
            this.County=County;
    }
         #endregion
          
             #region Public Properties
      private string m_FIPS;
        public string FIPS
        {
            get { return m_FIPS; }
            set
            {
                //if (FIPS.Length!=5)
                //    throw new ArgumentException(@"FIPS must be of 5 char's");
                //else
                    m_FIPS = value;
            }
        }
        private string m_StateCounty;
        public string StateCounty
        {
            get
            {
                return m_StateCounty;}
            set{
            m_StateCounty=value;}
        }
            
        private string m_State;
        public string State
        {
            get{return m_State;}
            set{m_State=value;}
        }
        private string m_County;
        public string County
        {
            get{return m_County;}
            set{m_County=value;}
        }

             #endregion

        }
    }

