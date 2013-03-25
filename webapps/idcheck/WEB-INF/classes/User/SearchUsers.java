/*
 * Copyright 2007 Yusuke Yamamoto
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package User;


import twitter4j.ResponseList;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.User;
import twitter4j.conf.ConfigurationBuilder;

/**
 * Search users with the specified query.
 *
 * @author Yusuke Yamamoto - yusuke at mac.com
 */
public class SearchUsers {
	MyConfigurationBuilder builder;
	
    /**
     * Usage: java twitter4j.examples.user.SearchUsers [query]
     *
     * @param args message
     * @return
     */
	public SearchUsers() {
		builder = new MyConfigurationBuilder();
	}
	
	public ResponseList<User> Twitters(String name){
		try {
            Twitter twitter = builder.twitter;
            int page = 1;
            ResponseList<User> users;      
            do {
            	users = twitter.searchUsers(name, page);
                page++;
            } while (users.size() != 0 && page < 2);
            return users;
           
        } catch (TwitterException te) {
            te.printStackTrace();
          }
		return null;
		
		
	}
	
	public String[] getResults(String name) {
		try {
			Twitter twitter = builder.twitter;
            int page = 1;
            int i=0;
            ResponseList<User> users;
            String [] persons = new String[100]; 
            do {
            	users = twitter.searchUsers(name, page);
            	for (User user : users) {
            		String str = "";
            		if (user != null) {
                		if (user.getName() != null && !user.getName().equals("null") && !user.getName().equals("")) {
                			str = str + "Name:" + user.getName() + ";";
                			System.out.println(user.getName());
                    		if (user.getLocation() != null) {
                    			str = str + user.getLocation();
                    		} else {
                    			str = str + "N/A;";
                    		}
                    		
                    		if (user.getMiniProfileImageURL() != null) {
                    			str = str + user.getMiniProfileImageURL();
                    		} else {
                    			str = str + "N/A;";
                    		}
                    		
                    		persons[i] = str;
                            i++;
                		}
            		}
            	}
            	page++;
            } while (users.size() != 0 && page < 2);
            return persons;
        } catch (TwitterException te) {
            te.printStackTrace();
          }
		return null;
	}
	
    public static void main(String[] args) {
        if (args.length < 1) {
            System.out.println("Usage: java twitter4j.examples.user.SearchUsers [query]");
        }
        
       SearchUsers search = new SearchUsers();
       String[] people =  search.getResults("Dylan");
	   int j = people.length;
	   for (String str: people) {
		   System.out.println(str);
	   }
	   
	}
    
}
	
