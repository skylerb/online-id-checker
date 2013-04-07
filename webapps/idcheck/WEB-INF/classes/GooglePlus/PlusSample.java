/*
 * Copyright (c) 2010 Google Inc.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software distributed under the License
 * is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied. See the License for the specific language governing permissions and limitations under
 * the License.
 */

package GooglePlus;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.java6.auth.oauth2.FileCredentialStore;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson.JacksonFactory;
import com.google.api.services.plus.Plus;
import com.google.api.services.plus.PlusScopes;
import com.google.api.services.plus.model.PeopleFeed;
import com.google.api.services.plus.model.Person;
import com.google.api.services.plus.model.Person.PlacesLived;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.List;


public class PlusSample {
	static final String APPLICATION_NAME = "thunder";
  
  /** Global instance of the HTTP transport. */
	static HttpTransport HTTP_TRANSPORT = new NetHttpTransport();

  /** Global instance of the JSON factory. */
	static final JacksonFactory JSON_FACTORY = new JacksonFactory();

	static Plus plus;

  /** Authorizes the installed application to access user's protected data. */
public static Credential authorize() throws Exception {
    // load client secrets
    GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(
        JSON_FACTORY, PlusSample.class.getResourceAsStream("/client_secrets.json"));
    if (clientSecrets.getDetails().getClientId().startsWith("Enter")
        || clientSecrets.getDetails().getClientSecret().startsWith("Enter ")) {
      System.out.println(
          "Enter Client ID and Secret from https://code.google.com/apis/console/?api=plus "
          + "into plus-cmdline-sample/src/main/resources/client_secrets.json");
      System.exit(1);
    }
    // set up file credential store
    FileCredentialStore credentialStore = new FileCredentialStore(
        new File(System.getProperty("user.home"), ".credentials/plus.json"), JSON_FACTORY);
    // set up authorization code flow
    GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
        HTTP_TRANSPORT, JSON_FACTORY, clientSecrets,
        Collections.singleton(PlusScopes.PLUS_ME)).setCredentialStore(credentialStore).build();
    // authorize
    return new AuthorizationCodeInstalledApp(flow, new LocalServerReceiver()).authorize("user");
  }

  public static void main(String[] args) {
    try {
      try {
       
        Credential credential = authorize();
        // set up global Plus instance
        plus = new Plus.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential)
            .setApplicationName(APPLICATION_NAME).build();
       
    
        String name = args[0];
        String [] people=getProfile(name);
        for (String person : people) {
        		if(person!=null){
        			String [] as = person.split(";");
        			System.out.println(as[0]);
        			System.out.println(as[1]);
        			System.out.println(as[2]);
        		}
        }
        return;
      } catch (IOException e) {
        System.err.println(e.getMessage());
      }
    } catch (Throwable t) {
      t.printStackTrace();
    }
    System.exit(1);
  }

 
  public static String[] getProfile(String name) throws IOException {
	  Credential credential = null;
	try {
		credential = authorize();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      // set up global Plus instance
      plus = new Plus.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential)
          .setApplicationName(APPLICATION_NAME).build();
    PeopleFeed peopleFeed = null;
    Plus.People.Search searchPeople = null;
    searchPeople = plus.people().search(name);
    peopleFeed = searchPeople.execute();
    List<Person> people = peopleFeed.getItems();
    String [] persons = new String[100];
    int pageNumber = 1;
    int i = 0;
    while (people != null && pageNumber <= 2) {
      pageNumber++;
      
      for (Person person : people) {
    	  String str = "";
    	  String value="";
    	  str = person.getDisplayName() +  ";";
    	  str = str + person.getImage().getUrl()+";";
    	  List<PlacesLived> places  = person.getPlacesLived();
    	  if(places != null){
    		  value = places.get(0).getValue();
    		  //for (PlacesLived place: places){value=place.getValue();}
    	  }
    	  else value = "NA";
    	  str = str + value;
    	  persons[i]= str;
    	  i++;
      }

  
      if (peopleFeed.getNextPageToken() == null) {
    	  	return persons;
    	  }

    	  // Prepare the next page of results
    	  searchPeople.setPageToken(peopleFeed.getNextPageToken());

    	  // Execute and process the next page request
    	  peopleFeed = searchPeople.execute();
    	  people = peopleFeed.getItems();

    }
    return persons;
    
  }
}
