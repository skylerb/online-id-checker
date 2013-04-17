package ProfileManager;

import java.util.HashMap;

public class ProfileHashMap {
	
	public HashMap<String, String> information;

	public ProfileHashMap() {
		information = new HashMap<String, String>();
	}
	
	public String toString() {
		return information.toString();
	}
}
