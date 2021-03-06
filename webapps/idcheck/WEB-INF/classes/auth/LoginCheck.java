package auth;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class LoginCheck {

    public static final int DB_CONNECTION_ERROR = -1;
    public static final int USER_NAME_TAKEN = 0;
    public static final int USER_CREATED = 1;

    public Connection getDsConnection() {
	Connection conn = null;
	try {
	    Context ctx = new InitialContext();
	    Context envCtx = (Context)ctx.lookup("java:comp/env");
	    DataSource ds = (DataSource)envCtx.lookup("jdbc/database");
	    conn = ds.getConnection();

	} catch (SQLException se) {
	    //Handle Later
	}
	catch (NamingException ne) {
	    //Handle Later
	}
	return conn;
    }

   	public boolean userExists(String user, String pass) {
		Connection conn = null;
		boolean ret = false;
		try {
			conn = getDsConnection();

			if(conn == null) {
				return false;	
			}

			PreparedStatement stmt = null;
			stmt = conn.prepareStatement("SELECT uname FROM users WHERE uname=?");
	    		stmt.setString(1, user);
	    		ResultSet rs = stmt.executeQuery();

			if(rs.getString(1).equals(user)) {
				ret = true;
			} else {
				ret = false;
			}
		} catch (SQLException e) {
			//
		} finally {
			try {
				if(conn!=null) {
					conn.close();
				}
			}catch(SQLException se) {}
		}

		return ret;
	}
    

    public int createUser(String user, String pass) {

	Connection conn = null;
	int ret = -100;

	try {
	    conn = getDsConnection();

	    if (conn == null) {
		ret = DB_CONNECTION_ERROR;
	    } 

	    PreparedStatement stmt = null;
		ret = 1;
		stmt = conn.prepareStatement("INSERT INTO users (uname, pass) VALUES (?,?)");
		ret = 2;
		stmt.setString(1, user);
		ret = 3;
		stmt.setString(2, pass);
		ret = -5;
		stmt.executeUpdate();
		ret = USER_CREATED;

	} 
	catch (SQLException se) {	    
	    //	    ret = DB_CONNECTION_ERROR;  
	} finally {
		try {
			if(conn!=null) {
				conn.close();
			}
		} catch(SQLException se) {
			//
		}
	}
	
	return ret;
    }


    public int validate(String user, String pass) {
	
	PreparedStatement stmt = null;
	ResultSet rs = null;
	Connection conn = null;

	try {

	    Context ctx = new InitialContext();
	    Context envCtx = (Context)ctx.lookup("java:comp/env");
	    DataSource ds = (DataSource)envCtx.lookup("jdbc/database");
	    conn = ds.getConnection();
	
	    stmt = conn.prepareStatement("SELECT uid, uname FROM users WHERE uname=? AND pass=?");
	    stmt.setString(1, user);
	    stmt.setString(2, pass);
	    rs = stmt.executeQuery();
	    
	    String res = rs.getString("uname");
	    if (res.equals(user)) {
		return rs.getInt("uid");
	    }
	    else {
		return 0;
	   }
	    
	} 
	catch (SQLException se) { }
	catch (NamingException ne) { 
	} finally {
		try {
			if(rs!=null) {
				rs.close();
			}
		}catch(SQLException se) {
		}
		try {
			if(conn!=null) {
				conn.close();
			}
		} catch(SQLException se) {}
	} 
     
	return 0;
    }

    
}

