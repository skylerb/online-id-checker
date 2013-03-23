package ProfileManager;

import java.util.Date;

public class Person {
	//String containing the users first name
	public String firstName = "";
	
	//String containing the users last name
	public String lastName = "";
	
	//String containing the users middle name if present
	public String middleName = "";
	
	//The location information for the person
	public Locale curAddress;
	
	//The location information for about the users hometown
	public Locale homeAddress;
	
	//Stores DOB for the person
	public Date DOB;
	
	public Person(String fullname) {
		String[] parts = fullname.split(" ");
		firstName = parts[0];
		if(parts.length > 1) {
			lastName = parts[parts.length - 1];
			String middle = "";
			for(int i = 1; i < parts.length - 1; i++) {
				middle += parts[i];
				if(i != parts.length - 2) {
					middle += " ";
				}
			}
			middleName = middle;
		}
	}
	
	public String getFullName() {
		String fn = firstName + " ";
		if(middleName != "") fn += middleName + " ";
		fn += lastName;
		return fn;
	}
	
	public static void main(String[] args) {
		Person p = new Person("Calvin Joel Sauer");
		assert p.firstName == "Calvin";
		assert p.lastName == "Sauer";
		assert p.middleName == "Joel";
		System.out.println(p.getFullName());
		
		p = new Person("Max Powers Henry Samual Bach");
		assert p.firstName == "Max";
		assert p.middleName == "Powers Henry Samual";
		assert p.lastName == "Bach";
		System.out.println(p.getFullName());
		
		p = new Person("Max Henry");
		assert p.firstName == "Max";
		assert p.middleName == "";
		assert p.lastName == "Henry";
		System.out.println(p.getFullName());
		
		p = new Person("Max");
		assert p.firstName == "Max";
		assert p.middleName == "";
		assert p.lastName == "";
		System.out.println(p.getFullName());
	}
}
