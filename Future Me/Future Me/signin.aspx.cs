using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Security;

namespace Future_Me
{
    public partial class signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.User.Identity.IsAuthenticated)
            {
                Response.Redirect("index.aspx");
            }
        }

        [WebMethod]
        public static void LoginMethod(string user)
        {
            try
            {
                FormsAuthentication.RedirectFromLoginPage(user, false);
            }catch(Exception e)
            {

            }
        }
    }
}