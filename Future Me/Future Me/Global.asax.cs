using Future_Me.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Caching;
using System.Web.Http;
using System.Web.Routing;

namespace Future_Me
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        private static CacheItemRemovedCallback OnCacheRemove = null;
        protected void Application_Start()
        {
            GlobalConfiguration.Configure(WebApiConfig.Register);
            GlobalConfiguration.Configuration.Formatters.JsonFormatter.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore;
            AddTask("DoStuff", 60);
        }
        private void AddTask(string name, int seconds)
        {
            OnCacheRemove = new CacheItemRemovedCallback(CacheItemRemoved);
            HttpRuntime.Cache.Insert(name, seconds, null,
                DateTime.Now.AddSeconds(seconds), Cache.NoSlidingExpiration,
                CacheItemPriority.NotRemovable, OnCacheRemove);
        }

        public void CacheItemRemoved(string k, object v, CacheItemRemovedReason r)
        {
            // do stuff here if it matches our taskname, like WebRequest
            // re-add our task so it recurs

            using (FutureMeProductEntities ctx = new FutureMeProductEntities())
            {
                try
                {
                    DateTime now = DateTime.Now.Date;
                    var ListMailsNotSend = ctx.MAILs.Where(x => x.Status == 0 && DbFunctions.TruncateTime(x.DeliverOn) == now).ToList();
                    if (ListMailsNotSend == null)
                    {
                        return;
                    }
                    
                    SmtpClient mySmtpClient = new SmtpClient();
                    MailAddress from = new MailAddress("shudantini@gmail.com", "Send2Future");
                    foreach(MAIL mail in ListMailsNotSend)
                    {
                        int status = mail.Status; // = 0
                        try
                        {
                            MailMessage email = new MailMessage();
                            email.From = from;
                            email.To.Add(mail.EmailTo.Trim());
                            email.Subject = mail.Subject.Trim();
                            email.SubjectEncoding = System.Text.Encoding.UTF8;

                            // set body-message and encoding
                            email.Body = mail.Letter.Trim();
                            email.BodyEncoding = System.Text.Encoding.UTF8;
                            // text or html
                            email.IsBodyHtml = true;

                            mySmtpClient.Send(email);
                            status = 1; // send
                        }
                        catch (SmtpException ex)
                        {
                            status = 3; // send error
                            //throw new ApplicationException("SmtpException has occured: " + ex.Message);
                        }

                        mail.Status = status;

                        int affected = ctx.SaveChanges();
                    }
                }
                catch (Exception ex)
                {
                    //throw ex;
                }
            }

            AddTask(k, Convert.ToInt32(v));
        }

    }
}
