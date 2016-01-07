using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Formatting;
using System.Web.Http;

namespace Future_Me.Models
{
    public class MailData : MAIL
    {
        public string userEmail{ get; set; }
    }
    public class FutureMeController : ApiController
    {
        [AcceptVerbs("POST", "OPTIONS")]
        [HttpPost]
        [Route("getMailOf")]
        public HttpResponseMessage GetAll([FromBody] USER userEmail)
        {
            using (FutureMeProductEntities ctx = new FutureMeProductEntities())
            {
                var user = ctx.USERS.Where(x => x.Email == userEmail.Email).FirstOrDefault();
                if (user == null)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest);
                }
                var list = ctx.MAILs.Where(x => x.IDUser == user.ID).ToList();
                for (int i = 0; i < list.Count; i++ )
                {
                    list[i].USER = null;
                }
                return Request.CreateResponse(HttpStatusCode.OK, list);
            }
        }

        [AcceptVerbs("POST", "OPTIONS")]
        [HttpPost]
        [Route("getUserId")]
        public HttpResponseMessage getUserId([FromBody] USER user)
        {
            using (FutureMeProductEntities ctx = new FutureMeProductEntities())
            {
                var id = ctx.USERS.Where(x => x.Email == user.Email).FirstOrDefault().ID;
                if (user == null)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest);
                }
                return Request.CreateResponse(HttpStatusCode.OK, id);
            }
        }

        [AcceptVerbs("POST", "OPTIONS")]
        [HttpPost]
        [Route("signIn")]
        public HttpResponseMessage signIn([FromBody] USER userData)
        {
            using (FutureMeProductEntities ctx = new FutureMeProductEntities())
            {
                var user = ctx.USERS.Where(x => x.Email == userData.Email && x.Password == userData.Password).FirstOrDefault();
                if (user == null)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest);
                }
                var returnUser = new USER();
                returnUser.Email = user.Email;
                returnUser.ID = user.ID;
                return Request.CreateResponse(HttpStatusCode.OK, returnUser);
            }
        }
        [AcceptVerbs("POST", "OPTIONS")]
        [HttpPost]
        [Route("addEmail")]
        public HttpResponseMessage addEmail([FromBody] MailData mailData)
        {
            using (FutureMeProductEntities ctx = new FutureMeProductEntities())
            {
                try
                {
                    var id = ctx.USERS.Where(x => x.Email == mailData.userEmail).FirstOrDefault().ID;
                    if (id == null)
                    {
                        return Request.CreateResponse(HttpStatusCode.BadRequest);
                    }
                    MAIL mail = new MAIL();
                    mail.IDUser = id;
                    mail.EmailTo = mailData.EmailTo;
                    mail.Subject = mailData.Subject;
                    mail.Letter = mailData.Letter;
                    mail.DeliverOn = mailData.DeliverOn;
                    mail.Status = 0; // Store mail, not send yet
                    mail.ViewStatus = mailData.ViewStatus;
                    ctx.MAILs.Add(mail);
                    ctx.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK);
                }
                catch (Exception e)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest, e);
                }
            }
        }

        [AcceptVerbs("POST", "OPTIONS")]
        [HttpPost]
        [Route("addUser")]
        public HttpResponseMessage addUser([FromBody] USER UserData)
        {
            using (FutureMeProductEntities ctx = new FutureMeProductEntities())
            {
                try
                {
                    USER user = new USER();
                    user.Email = UserData.Email;
                    user.Password = UserData.Password;
                    ctx.USERS.Add(user);
                    ctx.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK);
                }
                catch (Exception e)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest, e);
                }
            }
        }

        [HttpPut]
        [Route("updatePassword")]
        public HttpResponseMessage updatePassword([FromBody] USER UserData)
        {
            using (FutureMeProductEntities ctx = new FutureMeProductEntities())
            {
                var user = ctx.USERS.Where(x => x.ID == UserData.ID).FirstOrDefault();
                if (user == null)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest);
                }
                user.Password = UserData.Password;

                int affected = ctx.SaveChanges();

                return Request.CreateResponse(HttpStatusCode.OK, affected);
            }
        }

        [AcceptVerbs("DELETE", "OPTIONS")]
        [HttpPost]
        [Route("deleteMail")]
        public HttpResponseMessage deleteMail([FromBody] MAIL mail)
        {
            using (FutureMeProductEntities ctx = new FutureMeProductEntities())
            {
                var rs = ctx.MAILs.Where(x => x.IDUser == mail.IDUser && x.ID == mail.ID).FirstOrDefault();
                if (rs == null)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest);
                }

                ctx.MAILs.Remove(rs);

                int affected = ctx.SaveChanges();

                return Request.CreateResponse(HttpStatusCode.OK, affected);
            }
        }

        [AcceptVerbs("POST", "OPTIONS")]
        [HttpPost]
        [Route("updateMail")]
        public HttpResponseMessage updateMail([FromBody] MailData mailData)
        {
            using (FutureMeProductEntities ctx = new FutureMeProductEntities())
            {
                var id = ctx.USERS.Where(x => x.Email == mailData.userEmail).FirstOrDefault().ID;
                if (id == null)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest);
                }

                var mail = ctx.MAILs.Where(x => x.IDUser == id && x.ID == mailData.ID).FirstOrDefault();
                if (mail == null)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest);
                }
                if (mail.ViewStatus == 1 && mail.Status == 0)
                {
                    mail.EmailTo = mailData.EmailTo;
                    mail.Subject = mailData.Subject;
                    mail.Letter = mailData.Letter;
                    mail.DeliverOn = mailData.DeliverOn;
                    mail.ViewStatus = mailData.ViewStatus;
                    int affected = ctx.SaveChanges();

                    return Request.CreateResponse(HttpStatusCode.OK, affected);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest);
                }
            }
        }

        [HttpPut]
        [Route("api/update")]
        public HttpResponseMessage UpdateSV([FromBody] int userid, [FromBody] MAIL mailData)
        {
            using (FutureMeProductEntities ctx = new FutureMeProductEntities())
            {
                int mailid = mailData.ID;
                var mail = ctx.MAILs.Where(x => x.IDUser == userid && x.ID == mailid).FirstOrDefault();
                if (mail == null)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest);
                }
                // Check status
                if (mail.ViewStatus == 1 && mail.Status == 0)
                {
                    mail.EmailTo = mailData.EmailTo;
                    mail.Subject = mailData.Subject;
                    mail.Letter = mailData.Letter;
                    mail.DeliverOn = mailData.DeliverOn;

                    int affected = ctx.SaveChanges();

                    return Request.CreateResponse(HttpStatusCode.OK, affected);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest);
                }
            }
        }
        [AcceptVerbs("POST", "OPTIONS")]
        [HttpPost]
        [Route("googleSignIn")]
        public HttpResponseMessage googleSignIn([FromBody] USER userData)
        {
            var request = (HttpWebRequest)WebRequest.Create("https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=" + userData.Password);
            try
            {
                using (WebResponse response = request.GetResponse())
                {
                    using (FutureMeProductEntities ctx = new FutureMeProductEntities())
                    {
                        if (userData == null)
                            return Request.CreateResponse(HttpStatusCode.BadRequest);
                        var user = ctx.USERS.Where(x => x.Email == userData.Email).FirstOrDefault();
                        if (user == null)
                        {
                            try
                            {
                                USER u = new USER();
                                u.Email = userData.Email;
                                u.Password = userData.Password.Substring(0, 16);
                                ctx.USERS.Add(u);
                                ctx.SaveChanges();
                                return Request.CreateResponse(HttpStatusCode.OK);
                            }
                            catch (Exception e)
                            {
                                return Request.CreateResponse(HttpStatusCode.BadRequest, e);
                            }
                        }
                        else
                        {
                            var returnUser = new USER();
                            returnUser.Email = user.Email;
                            returnUser.ID = user.ID;
                            return Request.CreateResponse(HttpStatusCode.OK, returnUser);
                        }
                    }
                }
            }
            catch (WebException e)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, e);
            }

            
        }
    }
}
