package SocialNetworkAcces;

import java.net.MalformedURLException;
import java.net.URL;

import ProfileManager.Person;
import ProfileManager.Profile;

import com.restfb.DefaultFacebookClient;
import com.restfb.Parameter;
import com.restfb.json.JsonArray;
import com.restfb.json.JsonObject;

public class FacebookWrapper implements APIWrapper {
	
	private static final String FB_URL = "http://www.facebook.com/";

	private String accessToken;
	
	//Profile for the person being searched for
	private DefaultFacebookClient fbClient;
	
	public FacebookWrapper(String accessToken){
		//FacebookWrapper wrap = new FacebookWrapper("Alex");
		//wrap.findPossibleMatches(null);

		//System.out.println(accessToken);
		this.accessToken = accessToken;
		fbClient = new DefaultFacebookClient(accessToken);
		
		//Connection<User> userSearch = client.fetchConnection("search", User.class, Parameter.with("q", "Calvin"), Parameter.with("type", "user"));
	}
	
	public Profile[] findPossibleMatches(Person person) {
		
		JsonObject usersearch = null;
		JsonArray userarray = null;
		
		//Perform search
		usersearch = fbClient.fetchObject("search", JsonObject.class, Parameter.with("q", person.getFullName()), Parameter.with("type", "user"));
		userarray = (JsonArray)usersearch.get("data");
		
		//Iterate over results
		Profile[] profiles = new Profile[userarray.length()];
		for(int i = 0; i < userarray.length(); i++){
			JsonObject user = (JsonObject)userarray.get(i);
			person = new Person((String)user.get("name"));
			try {
				profiles[i] = new Profile(person, new URL(FB_URL + user.get("id")));
			} catch (MalformedURLException e) {
				e.printStackTrace();
			}
		}
		return profiles;
	}
	
	public Profile getProfileInfo(Profile profile) {
		
		return null;
	}
	
	public static void main(String[] args){
		FacebookWrapper wrap = new FacebookWrapper("AAACEdEose0cBAKZAFTwZA7FIWDEPJ9JxzxVQujU8ZACIh5L6HbWO5H5SpZB4fVnYVDP8zhWyXZAI4WlJGvfi0JQIykwtdUZCXEeZAeetV4IQgZDZD");
		Profile[] profiles = wrap.findPossibleMatches(new Person("Calvin Sauer"));
		for(Profile p : profiles) {
			System.out.println("Found " + p.person.getFullName() + " with url " + p.url.toString());
		}
		
		profiles = wrap.findPossibleMatches(new Person("Alex Jahns"));
		for(Profile p : profiles) {
			System.out.println("Found " + p.person.getFullName() + " with url " + p.url.toString());
		}
		
		profiles = wrap.findPossibleMatches(new Person("Derek Kunzman"));
		for(Profile p : profiles) {
			System.out.println("Found " + p.person.getFullName() + " with url " + p.url.toString());
		}
	}

}
