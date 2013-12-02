using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Booker.Models
{
    public class BookerContext : DbContext
    {
        public DbSet<Book> Books { get; set; }

        public DbSet<Author> Authors { get; set; }

        public BookerContext() : base(nameOrConnectionString: "BookerContext") { }
    }
}