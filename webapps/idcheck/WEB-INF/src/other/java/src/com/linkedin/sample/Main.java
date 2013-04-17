/*

Copyright 2011 LinkedIn Corporation

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

*/
package com.linkedin.sample;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import org.scribe.builder.ServiceBuilder;
import org.scribe.builder.api.LinkedInApi;
import org.scribe.model.OAuthRequest;
import org.scribe.model.Response;
import org.scribe.model.Token;
import org.scribe.model.Verb;
import org.scribe.oauth.OAuthService;


public class Main {

    private static String API_KEY = "3f7bt3vaktl0";
    private static String API_SECRET = "hkdXUqFqxNRzgGdB";
    private static String scope = "r_network";
    public static void main(String[] args) {
        Token accessToken = null;

        //Using the Scribe library we enter the information needed to begin the chain of Oauth2 calls.
        OAuthService service = new ServiceBuilder()
                                .provider(LinkedInApi.class)
                                .apiKey(API_KEY)
                                .apiSecret(API_SECRET)
                                .scope(scope)
                                .build();

        /*************************************
         * This first piece of code handles all the pieces needed to be granted access to make a data call
         */

        try{
            File file = new File("service.dat");

            if(file.exists()){
                //if the file exists we assume it has the AuthHandler in it - which in turn contains the Access Token
                ObjectInputStream inputStream = new ObjectInputStream(new FileInputStream(file));
                AuthHandler authHandler = (AuthHandler) inputStream.readObject();
                accessToken = authHandler.getAccessToken();
            } else {
                System.out.println("There is no stored Access token we need to make one");
                //In the constructor the AuthHandler goes through the chain of calls to create an Access Token
                AuthHandler authHandler = new AuthHandler(service);
                ObjectOutputStream outputStream = new ObjectOutputStream(new FileOutputStream("service.dat"));
                outputStream.writeObject( authHandler);
                outputStream.close();
                accessToken = authHandler.getAccessToken();
            }

        }catch (Exception e){
            System.out.println("Threw an exception when serializing: " + e.getClass() + " :: " + e.getMessage());
        }

       
        System.out.println();
        System.out.println("********A basic user profile call********");
        //The ~ means yourself - so this should return the basic default information for your profile in XML format
        //https://developer.linkedin.com/documents/profile-api
        String url = "http://api.linkedin.com/v1/people/~";
        OAuthRequest request = new OAuthRequest(Verb.GET, url);
        service.signRequest(accessToken, request);
        Response response = request.send();
        System.out.println(response.getBody());
        System.out.println();System.out.println();

        System.out.println("********Get the profile in JSON********");
        //This basic call profile in JSON format
        //You can read more about JSON here http://json.org
        url = "http://api.linkedin.com/v1/people/~";
        request = new OAuthRequest(Verb.GET, url);
        request.addHeader("x-li-format", "json");
        service.signRequest(accessToken, request);
        response = request.send();
        System.out.println(response.getBody());
        System.out.println();System.out.println();

       

        /////////////////field selectors
        System.out.println("********A basic user profile call with field selectors********");
        url = "http://api.linkedin.com/v1/people-search:(people:(first-name,last-name,headline,location:(name)))?first-name=John&facet=network,F,S,O";
        request = new OAuthRequest(Verb.GET, url);
        request.addHeader("x-li-format", "json");
        service.signRequest(accessToken, request);
        response = request.send();
        System.out.println(response.getHeaders().toString());
        System.out.println(response.getBody());
        System.out.println();System.out.println();


        
    }

}
