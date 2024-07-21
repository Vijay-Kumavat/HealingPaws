using System.ComponentModel.DataAnnotations;

namespace HealingPaws.Infrastructure.Models;

public class AppointmentRequest
{
    public int AppointmentId { get; set; }

    [Required(ErrorMessage = "Pet Name is required")]
    public string PetName { get; set; }

    public int OwnerId { get; set; }
    
    [Required(ErrorMessage = "Date is required")]
    public DateTime DateTime { get; set; } = DateTime.UtcNow;

    [Required(ErrorMessage = "Reason is required")]
    [StringLength(500, ErrorMessage = "Reason cannot be longer than 500 characters")]
    public string Reason { get; set; }

    public string Status { get; set; } = "Pending";

    [Required(ErrorMessage = "Name is required")]
    public string OwnerName { get; set; }

    [Required(ErrorMessage = "Phone is required")]
    public string OwnerPhoneNumber { get; set; }
}
