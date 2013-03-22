package auth;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class LoginCheck {

    public boolean validate(String user, String pass) {
	
	PreparedStatement stmt = null;

	try {

	    Context ctx = new InitialContext();
	    Context envCtx = (Context)ctx.lookup("java:comp/env");
	    DataSource ds = (DataSource)envCtx.lookup("jdbc/database");
	    Connection conn = ds.getConnection();
	
	    stmt = conn.prepareStatement("SELECT uname FROM users WHERE uname=? AND pass=?");
	    stmt.setString(1, user);
	    stmt.setString(2, pass);
	    ResultSet rs = stmt.executeQuery();
	    
	    String res = rs.getString(1);
	    if (res.equals(user)) {
		return true;
	    }
	    else {
		return false;
	    }
	    
	} 
	catch (SQLException se) { }
	catch (NamingException ne) { }
     
	return false;
    }

    
}
