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
        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                SmtpClient mySmtpClient = new SmtpClient();
                MailAddress from = new MailAddress("shudantini@gmail.com", "Send2Future");

                MailMessage mail = new MailMessage();
                mail.From = from;
                mail.To.Add(tbEmail.Text.Trim());
                mail.Subject = tbSubject.Text.Trim();
                mail.SubjectEncoding = System.Text.Encoding.UTF8;

                // set body-message and encoding
                mail.Body = tbLetter.Text.Trim();
                mail.BodyEncoding = System.Text.Encoding.UTF8;
                // text or html
                mail.IsBodyHtml = true;

                mySmtpClient.Send(mail);


            }
            catch (SmtpException ex)
            {
                throw new ApplicationException ("SmtpException has occured: " + ex.Message);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}