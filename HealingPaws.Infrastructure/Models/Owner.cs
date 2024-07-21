using System.ComponentModel.DataAnnotations;

namespace HealingPaws.Infrastructure.Models;

public class Owner
{
    public int OwnerId { get; set; }

    public string Name { get; set; }

    public string PhoneNumber { get; set; }
}
