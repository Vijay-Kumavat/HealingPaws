using System.ComponentModel.DataAnnotations;

namespace HealingPaws.Infrastructure.Models;

public class Appointment
{
    public int AppointmentId { get; set; }

    [Required(ErrorMessage = "Pet Name is required")]
    public string PetName { get; set; }

    public int OwnerId { get; set; }
    public Owner Owner { get; set; }

    public DateTime DateTime { get; set; } = DateTime.UtcNow;

    [Required(ErrorMessage = "Reason is required")]
    [StringLength(500, ErrorMessage = "Reason cannot be longer than 500 characters")]
    public string Reason { get; set; }

    public string Status { get; set; } // e.g., Confirmed, Pending, Cancelled
}