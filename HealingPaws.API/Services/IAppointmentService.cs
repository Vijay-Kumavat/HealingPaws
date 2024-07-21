using HealingPaws.Infrastructure.Models;

namespace HealingPaws.API.Services;

public interface IAppointmentService
{
    Task<List<Appointment>> GetAppointmentsAsync();
    Task<Appointment> GetAppointmentByIdAsync(int id);
    Task DeleteAppointmentByIdAsync(int id);
    Task PostAppointmentAsync(AppointmentRequest request);
}
