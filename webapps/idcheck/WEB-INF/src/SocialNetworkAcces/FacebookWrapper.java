package SocialNetworkAcces;

import java.util.List;
import java.util.ListIterator;

import com.restfb.Connection;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Parameter;
import com.restfb.json.JsonArray;
import com.restfb.json.JsonObject;
import com.restfb.types.Post;
import com.restfb.types.User;

import ProfileManager.Person;
import ProfileManager.Profile;

public class FacebookWrapper implements APIWrapper {
	
	private static final String FB_ACCESS_TOKEN = "AAACEdEose0cBAGzlhlWxAmAPJwS9mdtIKr8u89hnn5jGGwvRXOyXwkcuyVxyQTYmtZBMgUccnYIBWRK6iagZB5ZBlmyabCtUicfIwXN3wQBZArJp5F9g";
	//Profile for the person being searched for
	private DefaultFacebookClient fbClient;
	private String name;
	
	public FacebookWrapper(String name){
		fbClient = new DefaultFacebookClient(FB_ACCESS_TOKEN);
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
		//FacebookWrapper wrap = new FacebookWrapper("Alex");
		//wrap.findPossibleMatches(null);
		FacebookClient client = new DefaultFacebookClient(FacebookWrapper.FB_ACCESS_TOKEN);
		//Connection<User> userSearch = client.fetchConnection("search", User.class, Parameter.with("q", "Calvin"), Parameter.with("type", "user"));
		JsonObject usersearch = client.fetchObject("search", JsonObject.class, Parameter.with("q", "Calvin"), Parameter.with("type", "user"));
		JsonArray userarray = (JsonArray)usersearch.get("data");
		for(int i = 0; i < userarray.length(); i++){
			JsonObject user = (JsonObject)userarray.get(i);
			System.out.println("Found " + user.get("name") + " with id " + user.get("id"));
		}
	}

}
