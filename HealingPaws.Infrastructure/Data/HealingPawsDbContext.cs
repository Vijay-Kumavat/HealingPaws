using HealingPaws.Infrastructure.Models;
using Microsoft.EntityFrameworkCore;

namespace HealingPaws.Infrastructure.Data;

public class HealingPawsDbContext : DbContext
{
    public DbSet<Appointment> Appointments { get; set; }
    public DbSet<Owner> Owners { get; set; }

    public HealingPawsDbContext(DbContextOptions<HealingPawsDbContext> options) : base(options)
    {
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Appointment>()
            .HasOne(a => a.Owner)
            .WithMany()
            .HasForeignKey(a => a.OwnerId);
    }
}
