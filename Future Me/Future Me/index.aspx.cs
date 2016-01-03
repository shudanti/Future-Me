using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Future_Me_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var script = "$('#tbSubject').val('A letter form " + DateTime.Now.ToShortDateString() + "');";
        ClientScript.RegisterStartupScript(typeof(string), "textvaluesetter", script, true);
    }
}