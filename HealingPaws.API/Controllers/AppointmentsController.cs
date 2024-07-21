using HealingPaws.API.Services;
using HealingPaws.Infrastructure.Models;
using Microsoft.AspNetCore.Mvc;

namespace HealingPaws.API.Controllers;

[Route("api/[controller]")]
[ApiController]
public class AppointmentsController(IAppointmentService appointmentsService) : ControllerBase
{
    private readonly IAppointmentService _appointmentsService = appointmentsService;

    // GET: api/Appointments
    [HttpGet]
    public async Task<ActionResult<List<Appointment>>> GetAppointments()
    {
        var appointments = await _appointmentsService.GetAppointmentsAsync();
        return Ok(appointments);
    }

    // GET: api/Appointments/5
    [HttpGet("{id}")]
    public async Task<ActionResult<Appointment>> GetAppointment(int id)
    {
        var appointment = await _appointmentsService.GetAppointmentByIdAsync(id);
        return Ok(appointment);
    }

    //POST: api/Appointments
    [HttpPost("PostAppointment")]
    public async Task<ActionResult> PostAppointment([FromBody] AppointmentRequest request)
    {
        if (!ModelState.IsValid)
        {
            return BadRequest(ModelState);
        }

        await _appointmentsService.PostAppointmentAsync(request);
        return Ok();
    }


    // DELETE: api/Appointments/5
    [HttpDelete("{id}")]
    public async Task<ActionResult> DeleteAppointment(int id)
    {
        await _appointmentsService.DeleteAppointmentByIdAsync(id);
        return Ok();
    }
}
