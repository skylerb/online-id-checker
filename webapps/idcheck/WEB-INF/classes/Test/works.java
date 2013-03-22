package Test;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class works {
    int name;

    public int show() {
	try {
	    Context ctx = new InitialContext();
	    DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/database");
	    Connection conn = ds.getConnection();
	    Statement stat = conn.createStatement();
	    ResultSet rs = stat.executeQuery("insert into test (test) values (5)");
	    this.name = rs.getInt(0);
	} catch (SQLException se) {
	    //LOG.info(se.toString());
	} catch (NamingException ne) {
	   	//
	}
	return this.name;
    }
    
}
