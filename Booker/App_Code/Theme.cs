using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Booker.App_Code
{
    public class Theme
    {
        public string Name { get; set; }

        public Theme(string name)
        {
            Name = name;
        }
    }
}