package profileAnalyzer;

import ProfileManager.Profile;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;


public class ProfileAnalyzer {
	Profile profile1;
	Profile profile2;
	
	
	
	static float compareFields(String a, String b){
		  JaroDistance score = new JaroDistance();
		   float res = (float)score.d2(a,b);
		   return res;
	}
	Result compareAllFields(){
		return null;
	}
	

/*public static void main(String[] args) {
  JaroDistance score = new JaroDistance();
   String a = "Johdnfsd";
   String b = "John";
   double res = compareFields(a, b);
   System.out.println(res);
 }
*/
}
