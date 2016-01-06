using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Future_Me
{
    public partial class signinprocess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserID"] = Request.Params["ID"];
            FormsAuthentication.RedirectFromLoginPage(Request.Params["Email"], false);
        }
    }
}