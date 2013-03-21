package Test;
import java.sql.*;

public class works {
    String name;

    public String show() {
	LOG.info("getting name : " + this.name);
	try {
	    Context ctx = new InitialContext();
	    DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/yourdb");
	    Connection conn = ds.getConnection();
	    Statement stat = conn.createStatement();
	    ResultSet rs = stat.executeQuery("select username from admin");
	    this.name = rs.getInt(1);
	} catch (SQLException se) {
	    LOG.info(se.toString());
	} catch (NamingException ne) {
	    LOG.info(ne.toString());
	}
	return this.name;
    }
    
}
