using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Booker.Models;

namespace Booker
{
    public partial class AddBook : System.Web.UI.Page
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
            string authorAction = Request.QueryString["bookAction"];
            if (authorAction == "add")
            {
                LabelStatus.Text = "Book added!";
            }
            if (authorAction == "exist")
            {
                LabelStatus.Text = "This book is already exists in database.";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool isAlreadyExists;
            using (var context = new BookerContext())
            {
                var book = new Book
                {
                    Title = tbTitle.Text,
                    Year = Int32.Parse(tbYear.Text),
                    Author = context.Authors.Find(Int32.Parse(AuthorList.SelectedItem.Value))
                };
                isAlreadyExists = context.Books.FirstOrDefault(x => x.Title == book.Title && x.Year == book.Year && x.AuthorId == book.AuthorId) != null;
                if (!isAlreadyExists)
                {
                    context.Books.Add(book);
                    context.SaveChanges();
                }
            }
            if (isAlreadyExists)
            {
                Response.Redirect(Request.Url.AbsoluteUri.Substring(0,
                    Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count()) + "?bookAction=exist");
            }
            else
            {
                Response.Redirect(Request.Url.AbsoluteUri.Substring(0,
                    Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count()) + "?bookAction=add");
            }
        }
    }
}