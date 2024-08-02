using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WhyMe.Data;
using WhyMe.Models;

namespace WhyMe.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PastsController : ControllerBase
    {
        private readonly WhyMeContext _context;

        public PastsController(WhyMeContext context)
        {
            _context = context;
        }

        // GET: api/Pasts
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Past>>> GetPasts()
        {
            return await _context.Pasts.ToListAsync();
        }

        // GET: api/Pasts/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Past>> GetPast(int id)
        {
            var past = await _context.Pasts.FindAsync(id);

            if (past == null)
            {
                return NotFound();
            }

            return past;
        }

        // put: api/Pasts/5
        
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdatePast(int id, Past past)
        {
            if (id != past.Id)
            {
                return BadRequest();
            }

            _context.Entry(past).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PastExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Pasts        
        [HttpPost]
        public async Task<ActionResult<Past>> PostPast(Past past)
        {
            _context.Pasts.Add(past);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetPast", new { id = past.Id }, past);
        }

        // DELETE: api/Pasts/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePast(int id)
        {
            var past = await _context.Pasts.FindAsync(id);
            if (past == null)
            {
                return NotFound();
            }

            _context.Pasts.Remove(past);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool PastExists(int id)
        {
            return _context.Pasts.Any(e => e.Id == id);
        }
    }
}
