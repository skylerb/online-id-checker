package ProfileManager;

import java.net.URL;

public class Profile {
	//The person
	public Person person;
	//Url to persons profile
	public URL url;
	
	public Profile(Person p, URL url) {
		this.person = p;
		this.url = url;
	}
	
	@Override
	public String toString() {
		return person.getFullName() + " with url " + url.toString();
	}
}
