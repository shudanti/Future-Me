using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Future_Me
{
    public partial class letter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            checkTopbar();
            String s = Request.QueryString["link"];
            if (s == null)
                return;
            SingleLetter letter = getLetter(s);

            //panel 0

            Panel p = new Panel();
            p.Attributes.Add("class", "form-group");
            //label
            Label l = new Label();
            //l.Attributes.Add("runat", "server");
            l.Text = letter.Title;
            l.Attributes.Add("Class", "col-lg-2 control-label");
            l.ID = "Label1";
            l.ForeColor = System.Drawing.Color.RoyalBlue;
            //labelText.
            //panel1
            Panel p1 = new Panel();
            p1.Attributes.Add("class", "col-lg-10");
            Literal text = new Literal();
            text.Text = letter.Content;
            text.Mode = LiteralMode.PassThrough;
            //add
            p.Controls.Add(l);
            p.Controls.Add(p1);
            p1.Controls.Add(text);
            letterContain.Controls.Add(p);
        }
        static SingleLetter getLetter(string s)
        {
            SingleLetter letter = new SingleLetter();
            HtmlWeb futureme = new HtmlWeb();
            HtmlDocument doc = futureme.Load("https://www.futureme.org" + s);
            HtmlNode letterNode = doc.DocumentNode.SelectSingleNode("//*[@class='mainLeft']");
            HtmlNode titleNode = letterNode.SelectSingleNode("./h3");
            HtmlNodeCollection fullleter = letterNode.SelectNodes(".//*[@class='letter']");
            string content ="";
            foreach (HtmlNode l in fullleter)
            {
                string st = l.InnerText;
                content = content + st + "<br/><br/>";
            }
            letter.Title = titleNode.InnerText;
            letter.Content = content;
            return letter;
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