using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Future_Me
{
    public partial class signout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //var script = "var auth2 = gapi.auth2.getAuthInstance(); auth2.signOut().then(function () {console.log('User signed out.');});";
            //ClientScript.RegisterStartupScript(typeof(string), "signoutsc", script, true);
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
            
        }
    }
}