using Newtonsoft.Json;

namespace ComponentClassifier.Models
{
    public class Reading
    {
        public string TimeStamp { get; set; }
        public string Component { get; set; }
        public double Fault { get; set; }

        // These fields are not in the JSON, we will populate them.
        public string Result { get; set; }
        public string Type { get; set; }
    }
}
