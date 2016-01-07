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
    public partial class manager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            checkTopbar();
            if (!this.Page.User.Identity.IsAuthenticated)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
        }

        [WebMethod]
        public static string getUserEmail()
        {
            try
            {
                return HttpContext.Current.User.Identity.Name;
            }
            catch (Exception e)
            {
            }
            return null;
        }

        protected void btnControl_Click(object sender, EventArgs e)
        {
            //Server.Transfer("edit.aspx");
        }
        public void checkTopbar()
        {
            if (this.Page.User.Identity.IsAuthenticated)
            {
                managerLink.Visible = true;
                signUplink.Visible = false;
                signInlink.Visible = false;
                signOutlink.Visible = true;
            }
            else
            {
                managerLink.Visible = false;
                signUplink.Visible = true;
                signInlink.Visible = true;
                signOutlink.Visible = false;
            }
        }
    }
}