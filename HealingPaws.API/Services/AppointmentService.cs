using HealingPaws.API.Repositorys;
using HealingPaws.Infrastructure.Models;

namespace HealingPaws.API.Services
{
    public class AppointmentService(IAppointmentRepository appointmentRepository) : IAppointmentService
    {
        private readonly IAppointmentRepository _appointmentRepository = appointmentRepository;

        public async Task DeleteAppointmentByIdAsync(int id)
        {
            await _appointmentRepository.DeleteAppointmentByIdPlanAsync(id);
        }

        public async Task<Appointment> GetAppointmentByIdAsync(int id)
        {
            return await _appointmentRepository.GetAppointmentByIdPlanAsync(id);
        }

        public async Task<List<Appointment>> GetAppointmentsAsync()
        {
            return await _appointmentRepository.GetAppointmentsPlanAsync();
        }

        public async Task PostAppointmentAsync(AppointmentRequest request)
        {
            Appointment appointment = new Appointment
            {
                AppointmentId = request.AppointmentId,
                Owner = new Owner
                {
                    Name = request.OwnerName,
                    OwnerId = request.OwnerId,
                    PhoneNumber = request.OwnerPhoneNumber
                },
                DateTime = request.DateTime,
                OwnerId = request.OwnerId,
                PetName = request.PetName,
                Reason = request.Reason,
                Status = request.Status
            };

            await _appointmentRepository.PostAppointmentPlanAsync(appointment);
        }
    }
}
