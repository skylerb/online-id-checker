package profileManager;

import java.net.URL;

public class Profile {
	
	public Person person;
	public URL url;
	public Type type;
	
	//The type of profile
	public static enum Type {
		FACEBOOK, TWITTER, LINKEDIN, GOOGLE_PLUS
	}
	
	public Profile(Person p, URL url, Type type) {
		this.person = p;
		this.url = url;
		this.type = type;
	}
}
