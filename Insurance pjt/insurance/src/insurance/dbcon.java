package insurance;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class dbcon {
	public static Connection getCon() throws Exception{		
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
		return con;
	}
	public static void close(Connection con, PreparedStatement ps, ResultSet rs) {
		try {
			if(con!=null)con.close();
			if(ps!=null)ps.close();
			if(rs!=null)rs.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
