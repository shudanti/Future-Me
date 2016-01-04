using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Future_Me
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var script = "$('#tbSubject').val('A letter form " + DateTime.Now.ToShortDateString() + "');";
            ClientScript.RegisterStartupScript(typeof(string), "textvaluesetter", script, true);
        }
    }
}