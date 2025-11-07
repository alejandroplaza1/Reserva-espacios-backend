namespace ReservaEspacios.Api.Models
{
    public class Espacio
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public ICollection<Reserva> Reservas { get; set; }
    }
}

