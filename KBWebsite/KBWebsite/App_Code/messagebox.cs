
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls; 
using System.Text;


/// <summary> 
/// A JavaScript alert 
/// </summary> 
public static class Alert
{

    /// <summary> 
    /// Shows a client-side JavaScript alert in the browser. 
    /// </summary> 
    /// <param name="message">The message to appear in the alert.</param> 
    public static void Show(string message)
    {
        // Cleans the message to allow single quotation marks 
        string cleanMessage = message.Replace("'", "\\'");
        string script = "<script type=\"text/javascript\">alert('" + cleanMessage + "');</script>";

        // Gets the executing web page 
        Page page = HttpContext.Current.CurrentHandler as Page;

        // Checks if the handler is a Page and that the script isn't allready on the Page 
        if (page != null && !page.ClientScript.IsClientScriptBlockRegistered("alert"))
        {
            page.ClientScript.RegisterClientScriptBlock(typeof(Alert), "alert", script);
        }
    }
     public static void Show1()
    {
        // Cleans the message to allow single quotation marks 
       // string cleanMessage = message.Replace("'", "\\'");
        string script = "<script type=\"text/javascript\"> MyFunc();</script>";

        // Gets the executing web page 
        Page page = HttpContext.Current.CurrentHandler as Page;

        // Checks if the handler is a Page and that the script isn't allready on the Page 
        if (page != null && !page.ClientScript.IsClientScriptBlockRegistered("alert2"))
        {
            page.ClientScript.RegisterClientScriptBlock(typeof(Alert), "alert2", script);
        }
    }
  

           static public void confirm(string msg,string hiddenfield_name)
            {
            string sMsg = msg.Replace( "\n", "\\n" );
            sMsg = msg.Replace( "\"", "'" );

            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            string script = "<script type=\"text/javascript\">MSG('" + msg + "','" + hiddenfield_name + "')";
                
                

                 sb.Append("<script type=\"text/javascript\" language=\"javascript\"> MSG('" + msg + "','"+hiddenfield_name+"'){");

            sb.Append(@" if(confirm( """ + msg + @""" ))");
            sb.Append( @" { ");
            sb.Append( "document.forms[0]." + hiddenfield_name + ".value='1'; }" );
            sb.Append( @" else { ");
            sb.Append("document.forms[0]." + hiddenfield_name + ".value='0'; }" );

            sb.Append( @"}</script>" );

            Page page = HttpContext.Current.CurrentHandler as Page;

            // Checks if the handler is a Page and that the script isn't allready on the Page 
            if (page != null && !page.ClientScript.IsClientScriptBlockRegistered("MSG"))
            {
                page.ClientScript.RegisterClientScriptBlock(typeof(Alert), "MSG", sb.ToString());
            }
            }
   static public void confirm1(string msg,string hiddenfield_name)
{
                string sMsg = msg.Replace( "\n", "\\n" );
                sMsg = msg.Replace( "\"", "'" );

                StringBuilder sb = new StringBuilder();

                sb.Append( @"<INPUT type=hidden value='0' name='" + 
                  hiddenfield_name + "'>");

                sb.Append( "<script language=\"javascript\">" );

                sb.Append( @" if(confirm( """ + sMsg + @""" ))" );
                sb.Append( @" { ");
                sb.Append( "document.forms[0]." + hiddenfield_name + ".value='1';" 
                  + "document.forms[0].submit(); }" );
                sb.Append( @" else { ");
                sb.Append("document.forms[0]." + hiddenfield_name + ".value='0'; }" );

                sb.Append( @"</script>" );
                Page page = HttpContext.Current.CurrentHandler as Page;
                if (page != null && !page.ClientScript.IsClientScriptBlockRegistered("alert1"))
                {
                    page.ClientScript.RegisterClientScriptBlock(typeof(Alert), "alert1", sb.ToString());
                }

               
}

           public static void OkConfirm(string message, string hyperLink)
           {
               System.Text.StringBuilder sb = new System.Text.StringBuilder();
               sb.Append("<script language=\"JavaScript\">");
               sb.Append(@"if (confirm('" + message + "')) {document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_editMastertab_"+hyperLink+"').value = 1;}");
               sb.Append(@"</");
               sb.Append(@"script>");
               Page page = HttpContext.Current.CurrentHandler as Page;
               if (page != null && !page.ClientScript.IsClientScriptBlockRegistered("alert1"))
               {
                   page.ClientScript.RegisterClientScriptBlock(typeof(Alert), "alert1", sb.ToString());
               }
           } 


}
