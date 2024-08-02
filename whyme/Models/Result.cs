namespace WhyMe.Models
{
    public class Result
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public User User { get; set; }
        public int PastId { get; set; }
        public Past Past { get; set; }
        public string Reason { get; set; } = "Unknown reason";
    }
}
