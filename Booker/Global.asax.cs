using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using Booker;
using System.Data.Entity;
using Booker.Models;

namespace Booker
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterOpenAuth();
            //Database.SetInitializer(new BookerDatabaseInitializer());

            // Add Routes.
            RegisterRoutes(RouteTable.Routes);
        }

        void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute(
                "HomeRoute",
                "Home",
                "~/Default.aspx"
            );
            routes.MapPageRoute(
                "AboutRoute",
                "About",
                "~/About.aspx"
            );
            routes.MapPageRoute(
                "ContactRoute",
                "Contact",
                "~/Contact.aspx"
            );
            routes.MapPageRoute(
                "ProductListRoute",
                "ProductList",
                "~/ProductList.aspx"
            );

            routes.MapPageRoute(
                "ProductsByCategoryRoute",
                "ProductList/{categoryName}",
                "~/ProductList.aspx"
            );
            routes.MapPageRoute(
                "BookByTitleRoute",
                "Book/{bookTitle}",
                "~/BookList.aspx"
            );
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }
    }
}
