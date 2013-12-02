using System;
using System.ComponentModel.DataAnnotations;

namespace Booker.Models
{
    public class Book
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Title { get; set; }

        public int Year { get; set; }

        public int AuthorId { get; set; }

        public virtual Author Author { get; set; }
    }
}