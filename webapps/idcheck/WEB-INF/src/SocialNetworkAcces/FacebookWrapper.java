package SocialNetworkAcces;

import java.util.List;
import java.util.ListIterator;

import com.restfb.Connection;
import com.restfb.DefaultFacebookClient;
import com.restfb.Parameter;
import com.restfb.types.User;

import ProfileManager.Person;
import ProfileManager.Profile;

public class FacebookWrapper implements APIWrapper {
	//Profile for the person being searched for
	private DefaultFacebookClient fbClient;
	private String name;
	
	public FacebookWrapper(String name){
		fbClient = new DefaultFacebookClient("AAACEdEose0cBAGzlhlWxAmAPJwS9mdtIKr8u89hnn5jGGwvRXOyXwkcuyVxyQTYmtZBMgUccnYIBWRK6iagZB5ZBlmyabCtUicfIwXN3wQBZArJp5F9g");
		this.name = name; 
	}
	
	public Profile[] findPossibleMatches(Person person) {
		Connection<User> search = fbClient.fetchConnection("search", User.class, Parameter.with("q", name));
		ListIterator<User> users = search.getData().listIterator();
		
		while(users.hasNext()){
			User curUser = users.next();
			System.out.println("Id is =" + curUser.getName());	
		}
		
		return null;
	}

	
	public Profile getProfileInfo(Profile profile) {
		
		return null;
	}
	
	public static void main(String[] args){
		FacebookWrapper wrap = new FacebookWrapper("Alex");
		wrap.findPossibleMatches(null);
	}

}
