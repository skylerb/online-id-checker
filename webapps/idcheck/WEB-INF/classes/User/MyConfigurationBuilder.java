package User;

import twitter4j.Twitter;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

public class MyConfigurationBuilder {
    private ConfigurationBuilder cb; 
    public Twitter twitter;

    public MyConfigurationBuilder() {
      cb = new ConfigurationBuilder();
      cb.setDebugEnabled(true)
        .setOAuthConsumerKey("r6owsf2iZeuPEzodQNvBRQ")
        .setOAuthConsumerSecret("lnOuV475QgX9YCokCsHBICMQCReYx39IphaamBQ2Wck")
        .setOAuthAccessToken("1284783764-Me6VmSUQqfYVk7bQqDok26y6l0F5jhd4EfcIMhz")
        .setOAuthAccessTokenSecret("gJQ29gkC6Ud5lnoEwjkNC0l1Atn5pE5hawznqejb5E");
      TwitterFactory tf = new TwitterFactory(cb.build());
      twitter = tf.getInstance();
    }
}

