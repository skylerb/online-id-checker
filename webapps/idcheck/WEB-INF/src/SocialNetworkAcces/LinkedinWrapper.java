package SocialNetworkAcces;

import java.net.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.*;
import org.jsoup.select.*;

import java.util.ArrayList;

import ProfileManager.Person;
import ProfileManager.Profile;
import ProfileManager.ProfileHashMap;

public class LinkedinWrapper {
  
  private final String linkedinSearchBase = "http://www.linkedin.com/pub/dir/";
  private final String linkedinProfileBase = "http://www.linkedin.com/in/";
  
  public LinkedinWrapper(){
  }
  
  public ArrayList<ProfileHashMap> findPossibleMatches(Person person) {
    Document doc;
    ArrayList<ProfileHashMap> map = new ArrayList<ProfileHashMap>();
    try {
      
      doc = Jsoup.connect(getSearchPath(person)).get();
      Element resultSet = doc.getElementById("result-set"); //Search results list
      Elements vcards = resultSet.getElementsByClass("vcard"); //Aggregate results
      
      //Create Profile objects
      int i = 0;
      Profile[] results = new Profile[vcards.size()];
      for( Element vcard : vcards ) {
        String firstName = vcard.getElementsByClass("given-name").get(0).text();
        String lastName = vcard.getElementsByClass("family-name").get(0).text();
        Element basicInfo = vcard.getElementsByClass("vcard-basic").get(0);
        String profileUrl = vcard.getElementsByTag("a").get(1).attributes().get("href");
        
        Elements profilePhoto = vcard.getElementsByClass("profile-photo");
        String thumb_path = null;
        if( profilePhoto.size() > 0 ) {
          thumb_path = profilePhoto.get(0).getElementsByTag("img").get(0).attributes().get("src");
        }
        //System.out.println(firstName + " " + lastName +  ", url: " + profileUrl + ", thumb: " + thumb_path);
        
        ProfileHashMap hash = new ProfileHashMap();
        hash.information.put("name", firstName + " " + lastName);
        hash.information.put("url", profileUrl);
        hash.information.put("location", "N/A");
        if( thumb_path != null ) hash.information.put("pic", thumb_path);
        map.add(hash);
      }
      
    } catch( Exception e) {
      System.out.println("Bad connection");
      e.printStackTrace();
    }
    return map;
  }
  
  public Profile getProfileInfo(Profile profile) {
    
    return null;
  }
  
  private String getSearchPath(Person person) {
    String url = linkedinSearchBase + "?first=" + person.firstName + "&last=" + person.lastName + "&search=Search";
    return url;
  }
  
  private String getProfilePath(String username) {
    String url = linkedinProfileBase + "username";
    return url;
  }
  
  public static void main(String[] args){
    LinkedinWrapper wrap = new LinkedinWrapper();
    ArrayList<ProfileHashMap> map = wrap.findPossibleMatches(new Person("Calvin Sauer"));
    
    for (ProfileHashMap linked: map) {
      System.out.println(linked.information.get("name"));
    }
  }
  
}
