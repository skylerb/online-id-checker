package SocialNetworkAcces;
import ProfileManager.Person;
import ProfileManager.Profile;


public interface APIWrapper {
	
	//find possible matches return type profile[]
	public Profile[] findPossibleMatches(Person person);

	
	//Get all the needed information for profile info
	public Profile getProfileInfo(Profile profile);
}
