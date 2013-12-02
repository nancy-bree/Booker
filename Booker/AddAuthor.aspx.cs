using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Booker.Models;

namespace Booker
{
    public partial class AddAuthor : System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            if (Session["MyTheme"] == null)
            {
                Session.Add("MyTheme", "Theme1");
                Page.Theme = ((string)Session["MyTheme"]);
            }
            else
            {
                Page.Theme = ((string)Session["MyTheme"]);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string authorAction = Request.QueryString["authorAction"];
            if (authorAction == "add")
            {
                LabelStatus.Text = "Author added!";
            }
            if (authorAction == "exist")
            {
                LabelStatus.Text = "This author is already exists in database.";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool isAlreadyExists;
            var author = new Author
            {
                Name = Name.Text,
                Surname = Surname.Text
            };
            using (var context = new BookerContext())
            {
                isAlreadyExists = context.Authors.FirstOrDefault(x => x.Name == author.Name && x.Surname == author.Surname) != null;
                if (!isAlreadyExists)
                {
                    context.Authors.Add(author);
                    context.SaveChanges();
                }
            }
            if (isAlreadyExists)
            {
                Response.Redirect(Request.Url.AbsoluteUri.Substring(0,
                    Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count()) + "?authorAction=exist");
            }
            else
            {
                Response.Redirect(Request.Url.AbsoluteUri.Substring(0,
                    Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count()) + "?authorAction=add");
            }
        }
    }
}