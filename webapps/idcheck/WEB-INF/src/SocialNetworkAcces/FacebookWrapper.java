package SocialNetworkAcces;

import java.net.MalformedURLException;
import java.net.URL;

import ProfileManager.Person;
import ProfileManager.Profile;

import com.restfb.DefaultFacebookClient;
import com.restfb.Parameter;
import com.restfb.exception.FacebookOAuthException;
import com.restfb.json.JsonArray;
import com.restfb.json.JsonObject;

public class FacebookWrapper implements APIWrapper {
	
	private static final String FB_URL = "http://www.facebook.com/";
	//Profile for the person being searched for
	private DefaultFacebookClient fbClient;
	
	public FacebookWrapper(String fb_token){
		fbClient = new DefaultFacebookClient(fb_token);
		//FacebookWrapper wrap = new FacebookWrapper("Alex");
		//wrap.findPossibleMatches(null);
		this.fbClient = new DefaultFacebookClient(fb_token);
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
		FacebookWrapper wrap = new FacebookWrapper("AAACEdEose0cBAFBpHMYWhN8cM357FhByWL4rZBCKYaAxQZAPvI8ZB7wbly3zZAWl8ZCIRfgVD2RUU98Bc1ZAaisUjSQeYsbKVmL0yAe28OZCgZDZD");
		
		try {
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
		} catch (FacebookOAuthException e) {
			//Fetch a new access token
			wrap = new FacebookWrapper(new DefaultFacebookClient().obtainExtendedAccessToken("627719843920827", "5cbbac27f24d05a3f9e75a3921ff9a6b").getAccessToken());
		}
	}

}
