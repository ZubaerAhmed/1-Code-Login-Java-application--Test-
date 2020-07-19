package Test;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class D_Database extends B_TestButton{
	//Download and install SQLite workstation
	//Environment setup for sqlite
	//Download jar file for sqlite to external library in eclipse
	// Undo command is Ctrl+Z 
	//the shortcut for Redo is Ctrl+Y	
	static Connection con = null;
	static ResultSet rs = null;
	static Statement stmt = null;
	
	public static void connectionDB() throws SQLException, ClassNotFoundException {
			
			try {
			Class.forName("org.sqlite.JDBC");
			con = DriverManager.getConnection("jdbc:sqlite:C://sqlite3/Login.db");
			}catch(Exception e) {
			System.err.println( e.getClass().getName() + ": " + e.getMessage() );
			}
			System.out.println("Connection done with database");
		}
	//------Select BD------------------------------------------
			public static List selectDB() throws SQLException, ClassNotFoundException {
				connectionDB();//For connection database
				
				String sql = "SELECT username, password from users  ;";
				List list = new ArrayList();
				
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					String user = rs.getString("username");
					String pass = rs.getString("password");
					list.add(user);
					list.add(pass);					
				//	System.out.println(user + " -> "+ pass);	
				}
				rs.close();
				stmt.close();
				con.close();
			//	System.out.println("All data retrived");
				return list;
			} 

}






