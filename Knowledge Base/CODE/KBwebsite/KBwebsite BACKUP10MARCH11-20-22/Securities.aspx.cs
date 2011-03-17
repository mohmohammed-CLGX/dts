using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Securities : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsave_Submit(object sender, EventArgs e)
    {
        Response.Write("testing submit");
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        Response.Write("testing save");
    }
}
