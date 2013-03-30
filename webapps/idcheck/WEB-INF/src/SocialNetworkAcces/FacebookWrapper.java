package SocialNetworkAcces;

import java.net.MalformedURLException;
import java.net.URL;

import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Parameter;
import com.restfb.json.JsonArray;
import com.restfb.json.JsonObject;
import ProfileManager.Person;
import ProfileManager.Profile;

public class FacebookWrapper implements APIWrapper {
	
	private static final String FB_URL = "http://www.facebook.com/";
	private static final String FB_ACCESS_TOKEN = "AAACEdEose0cBADDGQmXcXi6ZAwX51CrZALb6DEFlZAt0kLsmq9SYGwqlTZBy2ahGHJw0J02i042zCJdrSMRlNIrGcYUVhmnrh3ZBZCtzQbdgZDZD";
	//Profile for the person being searched for
	private DefaultFacebookClient fbClient;
	
	public FacebookWrapper(){
		fbClient = new DefaultFacebookClient(FB_ACCESS_TOKEN);
		//FacebookWrapper wrap = new FacebookWrapper("Alex");
		//wrap.findPossibleMatches(null);
		this.fbClient = new DefaultFacebookClient(FacebookWrapper.FB_ACCESS_TOKEN);
		//Connection<User> userSearch = client.fetchConnection("search", User.class, Parameter.with("q", "Calvin"), Parameter.with("type", "user"));
		
	}
	
	public Profile[] findPossibleMatches(Person person) {
		JsonObject usersearch = this.fbClient.fetchObject("search", JsonObject.class, Parameter.with("q", person.getFullName()), Parameter.with("type", "user"));
		JsonArray userarray = (JsonArray)usersearch.get("data");
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
		FacebookWrapper wrap = new FacebookWrapper();
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
