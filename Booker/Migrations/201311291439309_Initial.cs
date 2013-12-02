namespace Booker.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initial : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Books", "Title", c => c.String(nullable: false));
            AlterColumn("dbo.Authors", "Name", c => c.String(nullable: false));
            AlterColumn("dbo.Authors", "Surname", c => c.String(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Authors", "Surname", c => c.String());
            AlterColumn("dbo.Authors", "Name", c => c.String());
            AlterColumn("dbo.Books", "Title", c => c.String());
        }
    }
}
