using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Future_Me.Models
{
    public class FutureMeController : ApiController
    {
        [HttpGet]
        [Route("getMailOf")]
        public HttpResponseMessage GetAll([FromBody] int userid)
        {
            using (FutureMeProductEntities ctx = new FutureMeProductEntities())
            {
                var list = ctx.MAILs.Where(x => x.IDUser == userid).ToList();
                return Request.CreateResponse(HttpStatusCode.OK, list);
            }
        }

        [AcceptVerbs("POST", "OPTIONS")]
        [HttpPost]
        [Route("addEmail")]
        public HttpResponseMessage addEmail([FromBody] int userid, [FromBody] MAIL mailData)
        {
            using (FutureMeProductEntities ctx = new FutureMeProductEntities())
            {
                try
                {
                    MAIL mail = new MAIL();
                    mail.IDUser = mailData.IDUser;
                    mail.EmailTo = mailData.EmailTo;
                    mail.Subject = mailData.Subject;
                    mail.Letter = mailData.Letter;
                    mail.DeliverOn = mailData.DeliverOn;
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
        [HttpDelete]
        [Route("deleteMail")]
        public HttpResponseMessage deleteMail([FromBody] int userid, [FromBody] int mailid)
        {
            using (FutureMeProductEntities ctx = new FutureMeProductEntities())
            {
                var sv = ctx.MAILs.Where(x => x.IDUser == userid && x.ID == mailid).FirstOrDefault();
                if (sv == null)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest);
                }

                ctx.MAILs.Remove(sv);

                int affected = ctx.SaveChanges();

                return Request.CreateResponse(HttpStatusCode.OK, affected);
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

                mail.EmailTo = mailData.EmailTo;
                mail.Subject = mailData.Subject;
                mail.Letter = mailData.Letter;
                mail.DeliverOn = mailData.DeliverOn;

                int affected = ctx.SaveChanges();

                return Request.CreateResponse(HttpStatusCode.OK, affected);
            }
        }
    }
}
