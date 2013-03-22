package SocialNetworkAcces;

import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Parameter;
import com.restfb.json.JsonArray;
import com.restfb.json.JsonObject;
import ProfileManager.Person;
import ProfileManager.Profile;

public class FacebookWrapper implements APIWrapper {
	
	private static final String FB_ACCESS_TOKEN = "AAACEdEose0cBAGzlhlWxAmAPJwS9mdtIKr8u89hnn5jGGwvRXOyXwkcuyVxyQTYmtZBMgUccnYIBWRK6iagZB5ZBlmyabCtUicfIwXN3wQBZArJp5F9g";
	//Profile for the person being searched for
	private DefaultFacebookClient fbClient;
	public String[] userarray;
	
	public FacebookWrapper(){
		fbClient = new DefaultFacebookClient(FB_ACCESS_TOKEN);
		//FacebookWrapper wrap = new FacebookWrapper("Alex");
		//wrap.findPossibleMatches(null);
		FacebookClient client = new DefaultFacebookClient(FacebookWrapper.FB_ACCESS_TOKEN);
		//Connection<User> userSearch = client.fetchConnection("search", User.class, Parameter.with("q", "Calvin"), Parameter.with("type", "user"));
		JsonObject usersearch = client.fetchObject("search", JsonObject.class, Parameter.with("q", "alex"), Parameter.with("type", "user"));
		JsonArray userarray = (JsonArray)usersearch.get("data");
		String[] users = new String[userarray.length()];
		for(int i = 0; i < userarray.length(); i++){
			JsonObject user = (JsonObject)userarray.get(i);
			users[i] = "Found " + user.get("name") + " with id " + user.get("id");
		}
		this.userarray = users;
	}
	
	public Profile[] findPossibleMatches(Person person) {
		
		return null;
	}

	
	public Profile getProfileInfo(Profile profile) {
		
		return null;
	}
	
	public static void main(String[] args){
		
	}

}
