using HealingPaws.Infrastructure.Models;

namespace HealingPaws.API.Repositorys;

public interface IAppointmentRepository
{
    Task<List<Appointment>> GetAppointmentsPlanAsync();
    Task<Appointment> GetAppointmentByIdPlanAsync(int id);
    Task DeleteAppointmentByIdPlanAsync(int id);
    Task PostAppointmentPlanAsync(Appointment request);
}
