package ProfileManager;

import java.util.Date;

public class Person {
	//String containing the users full name
	private String fullName;
	
	//String containing the users first name
	private String firstName;
	
	//String containing the users last name
	private String lastName;
	
	//String containing the users middle name if present
	private String middleName;
	
	//The location information for the person
	private Locale curAddress;
	
	//The location information for about the users hometown
	private Locale homeAddress;
	
	//Stores DOB for the person
	private Date DOB;
}
