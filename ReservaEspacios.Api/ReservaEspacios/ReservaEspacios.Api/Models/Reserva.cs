namespace ReservaEspacios.Api.Models
{
    public class Reserva
    {
        public int Id { get; set; }
        public int UsuarioId { get; set; }
        public int EspacioId { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
        public string Estado { get; set; } = string.Empty;

        public Usuario Usuario { get; set; } = null!;
        public Espacio Espacio { get; set; } = null!;
    }
}
