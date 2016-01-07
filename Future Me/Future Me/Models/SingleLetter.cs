using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Future_Me
{
    public class SingleLetter
    {
        string _title;

        public string Title
        {
            get { return _title; }
            set { _title = value; }
        }
        string _content;

        public string Content
        {
            get { return _content; }
            set { _content = value; }
        }
        string link;

        public string Link
        {
            get { return link; }
            set { link = value; }
        }
    }
}