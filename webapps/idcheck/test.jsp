<%
	try {
          Context ctx = new InitialContext();
          DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/database");
          Connection conn = ds.getConnection();
          Statement stat = conn.createStatement();
          ResultSet rs = stat.executeQuery("select test from test");
          this.name = rs.getString(1);
    } catch (SQLException se) {
          LOG.info(se.toString());
    } catch (NamingException ne) {
          LOG.info(ne.toString());
    }

	out.print(this.name);
%>

