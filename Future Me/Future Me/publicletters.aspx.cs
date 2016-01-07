using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Future_Me
{
    public partial class publicletters : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            checkTopbar();
            List<SingleLetter> letters = getAllPublicLetters();
            foreach (SingleLetter s in letters)
            {
                //panel 0
                
                Panel p = new Panel();
                p.Attributes.Add("class", "form-group");
                //label
                Label l = new Label();
                //l.Attributes.Add("runat", "server");
                l.Text = s.Title;
                l.Attributes.Add("Class", "col-lg-2 control-label");
                l.ID = "Label1";
                l.ForeColor = System.Drawing.Color.RoyalBlue;
                //labelText.
                //panel1
                Panel p1 = new Panel();
                p1.Attributes.Add("class", "col-lg-10");
                Literal text = new Literal();
                text.Text = s.Content;
                //link
                HyperLink h = new HyperLink();
                h.NavigateUrl = s.Link;
                h.ForeColor = System.Drawing.Color.White;
                //add
                h.Controls.Add(p);
                p.Controls.Add(l);
                p.Controls.Add(p1);
                p1.Controls.Add(text);
                letterContain.Controls.Add(h);
            }
        }
        static List<SingleLetter> getAllPublicLetters()
        {
            List<SingleLetter> letters = new List<SingleLetter>();
            HtmlWeb futureme = new HtmlWeb();
            for (int i = 0; i < 50; i += 10)
            {
                HtmlDocument doc = futureme.Load("https://www.futureme.org/letters/recently_delivered?offset=" + i.ToString());
                HtmlNode letterNode = doc.DocumentNode.SelectSingleNode("//*[@class='mainLeft']");
                HtmlNodeCollection previews = letterNode.SelectNodes(".//*[@class='letter_preview JQLetterBodyPreview']");
                foreach (HtmlNode n in previews)
                {
                    HtmlNode titleNode = n.SelectSingleNode(".//*[@class='bold emailSubject']");
                    HtmlNode contentNode = n.SelectSingleNode("(.//*[@class='short'])");
                    string title = titleNode.InnerText;
                    string link = "/letter.aspx?link=" + titleNode.Attributes["href"].Value;
                    string content = contentNode.InnerText;
                    SingleLetter s = new SingleLetter();
                    s.Title = title;
                    s.Link = link;
                    s.Content = content;
                    letters.Add(s);
                }
            }
            return letters;
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