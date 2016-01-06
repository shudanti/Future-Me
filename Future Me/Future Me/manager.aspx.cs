using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Future_Me
{
    public partial class manager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
    }
}