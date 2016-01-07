using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Future_Me
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            checkTopbar();
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