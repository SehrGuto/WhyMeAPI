using Microsoft.EntityFrameworkCore;
using WhyMe.Models;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace WhyMe.Data   

{
    public class WhyMeContext : DbContext
    {
        public DbSet<User> Users { get; set; }
        public DbSet<Past> Pasts { get; set; }
        public DbSet<Result> Results { get; set; }

        public WhyMeContext(DbContextOptions<WhyMeContext> options) : base(options)
        {
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
                optionsBuilder.UseSqlite("Data Source=WhyMe.db");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>()
                .HasMany(u => u.Results)
                .WithOne(r => r.User)
                .HasForeignKey(r => r.UserId); 

            modelBuilder.Entity<Past>()
                .HasMany(p => p.Results)
                .WithOne(r => r.Past)
                .HasForeignKey(r => r.PastId);

            modelBuilder.Entity<User>()
                .HasIndex(u => u.Email)
                .IsUnique();

            modelBuilder.Entity<Result>()
                .Property(r => r.Reason)
                .HasDefaultValue("Unknown reason");
        }
    }
}
