using Microsoft.EntityFrameworkCore;
using ReservaEspacios.Api.Models;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    public DbSet<Usuario> Usuarios { get; set; }
    public DbSet<Espacio> Espacios { get; set; }
    public DbSet<Reserva> Reservas { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        // Relaciones
        modelBuilder.Entity<Reserva>()
            .HasOne(r => r.Usuario)
            .WithMany(u => u.Reservas)
            .HasForeignKey(r => r.UsuarioId);

        modelBuilder.Entity<Reserva>()
            .HasOne(r => r.Espacio)
            .WithMany(e => e.Reservas)
            .HasForeignKey(r => r.EspacioId);
    }
}
