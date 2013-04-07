package ProfileAnalyzer;


import ProfileManager.Profile;

//import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;


public class ProfileAnalyzer {

	Profile profile1;
	Profile profile2;
	
	
	// for comparing profiles from Two Social Networks
	static float compareTwoProf(String a, String b){
		  JaroDistance score = new JaroDistance();
		  float res = (float)score.d2(a,b);
		   return res;
	}
	// for comparing profiles from Three Social Networks
	static float compareThreeProf(String a, String b, String c){
		float resOne, resTwo, resThr, res;
		 JaroDistance s = new JaroDistance();
		 
		   resOne = (float)s.d2(a,b);
		   resTwo = (float)s.d2(a,c);
		   resThr = (float)s.d2(c,b);
		   res = (resOne+resTwo+resThr)/3;
		   return res;
	}
	//// for comparing profiles from Four Social Networks
	static float compareFourProf(String a, String b, String c, String d){
		float resOne, resTwo, resThr, resFour, resFive, resSix, res;
		 JaroDistance s = new JaroDistance();
		 
		   resOne = (float)s.d2(a,b);
		   resTwo = (float)s.d2(a,c);
		   resThr = (float)s.d2(c,b);
		   resFour = (float)s.d2(a,d);
           resFive = (float)s.d2(d,b);	
           resSix = (float)s.d2(c,d);
		   res = (resOne+resTwo+resThr+resFour+resFive+resSix)/6;
		   return res;
	}
	
	/*
	Result compareAllFields(){
		return null;
	}
	*/

public static void main(String[] args) {
  //JaroDistance score = new JaroDistance();
   String a = "Johnatan";
   String b = "John";
   String c = "John";
   String d = "Johnv";
   double res = compareFourProf(a, b, c,d);
   System.out.println(res);
 }

}
