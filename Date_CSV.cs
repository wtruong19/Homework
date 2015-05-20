using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Date_CSV
{
    class Date_CSV
    {
        static void Main(string[] args)
        {
            //Create datetime for start and end dates
            DateTime startCal = new DateTime(2000, 1, 1);
            DateTime endCal = new DateTime(2004, 12, 31);
            int quarter;

            // Print out dates in CSV form for each day between the start and end dates
            for (DateTime start = startCal; start <= endCal; start = start.AddDays(1))
            {
                quarter = ((start.Month + 2) / 3); //compute quarter for current date
                System.Console.WriteLine("{0:yyyy-MM-dd, MMMM}, {1}, {0:dddd}, Q{2}", start, start.DayOfYear, quarter);
            }
        }
    }
}
