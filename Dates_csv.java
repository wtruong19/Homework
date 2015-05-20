// In this case, it saves time to use existing packages
import java.util.*; // for Date and Calendar packages
import java.text.*; // for simple date text formatting 

public class Dates_csv {

	public static void main(String[] args) throws ParseException 
	{
		//Create calendars for start and end dates
		Calendar startCal = Calendar.getInstance();
		startCal.set(2010, 01, 20); 
		Calendar endCal = Calendar.getInstance();
		endCal.set(2010, 05, 26);
		
		int quarter;
		
		// Used to format the date in CSV form
		SimpleDateFormat csv = new SimpleDateFormat(
				"yyyy-MM-dd, MMMM, D, EEEE, ");
		
		// print out dates in CSV form for each day between the start and end dates
		for (Date date = startCal.getTime(); startCal.before(endCal); startCal.add(Calendar.DATE, 1), date = startCal.getTime())
		{
			System.out.print(csv.format(date));
			quarter = (startCal.get(Calendar.MONTH)/3+1); //compute quarter for current date
			System.out.println("Q"+quarter);
		}
	}
}
