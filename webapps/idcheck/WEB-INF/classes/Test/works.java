package Test;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class works {

    public String show() {

	try {
	    Context ctx = new InitialContext();
	    Context envCtx = (Context)ctx.lookup("java:comp/env");
	    DataSource ds = (DataSource)envCtx.lookup("jdbc/database");
	    Connection conn = ds.getConnection();
	    Statement stat = conn.createStatement();
	    ResultSet rs = stat.executeQuery("select * from test;");

	    //name = rs.getInt(1);
	} catch (SQLException se) {
	    return "hi";
	    //	    return (se.toString());
	} catch (NamingException ne) {
	    //return "GG NAMING";
	}
	return "made it";
		//return 0;
    }
    
}
