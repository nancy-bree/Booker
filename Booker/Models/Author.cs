using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Booker.Models
{
    public class Author
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public string Surname { get; set; }

        [NotMapped]
        public string FullName
        {
            get
            {
                return Surname + ", " + Name;
            }
        } 

        public virtual ICollection<Book> Books { get; set; }
    }
}