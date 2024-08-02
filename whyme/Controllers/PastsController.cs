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
    }
}
