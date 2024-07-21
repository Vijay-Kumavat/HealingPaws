using HealingPaws.Infrastructure.Data;
using HealingPaws.Infrastructure.Models;
using Microsoft.EntityFrameworkCore;

namespace HealingPaws.API.Repositorys;

public class AppointmentRepository(HealingPawsDbContext context) : IAppointmentRepository
{
    private readonly HealingPawsDbContext _context = context;

    public async Task DeleteAppointmentByIdPlanAsync(int id)
    {
        var appointment = await _context.Appointments.FindAsync(id);
        if (appointment != null)
        {
            appointment.Status = "Cancelled";
            _context.Appointments.Update(appointment);
            await _context.SaveChangesAsync();
        }
    }

    public async Task<Appointment> GetAppointmentByIdPlanAsync(int id)
    {
        return (await _context.Appointments.Include(i => i.Owner).FirstOrDefaultAsync(f => f.AppointmentId == id && f.Status != "Cancelled" && f.DateTime >= DateTime.UtcNow))!;
    }

    public async Task<List<Appointment>> GetAppointmentsPlanAsync()
    {
        return await _context.Appointments.Include(i => i.Owner).Where(w => w.Status != "Cancelled" && w.DateTime >= DateTime.UtcNow).OrderBy(o => o.DateTime).ToListAsync();
    }

    public async Task PostAppointmentPlanAsync(Appointment request)
    {
        var existingAppointment = await _context.Appointments
            .FirstOrDefaultAsync(p => p.AppointmentId == request.AppointmentId);

        if (existingAppointment != null)
        {
            // Update the existing appointment properties
            existingAppointment.PetName = request.PetName;
            existingAppointment.DateTime = request.DateTime;
            existingAppointment.Reason = request.Reason;
            existingAppointment.Status = "Reschedule";

            // Ensure related entities are attached correctly
            if (request.Owner != null)
            {
                var existingOwner = await _context.Owners.AsNoTracking()
                    .FirstOrDefaultAsync(o => o.OwnerId == request.Owner.OwnerId);

                if (existingOwner != null)
                {
                    existingAppointment.Owner = request.Owner;
                    if(existingOwner.Name.ToLower() != request.Owner.Name.ToLower() || existingOwner.PhoneNumber.ToLower() != request.Owner.PhoneNumber.ToLower())
                    {
                        existingOwner.Name = request.Owner.Name;
                        existingOwner.PhoneNumber = request.Owner.PhoneNumber;
                        _context.Owners.Update(existingOwner);
                    }
                }
            }

            _context.Appointments.Update(existingAppointment);
        }
        else
        {
            await _context.Appointments.AddAsync(request);
        }

        await _context.SaveChangesAsync();
    }
}
