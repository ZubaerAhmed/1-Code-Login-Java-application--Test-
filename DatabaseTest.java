package Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseTest {

	static Connection con = null;
	static ResultSet rs = null;
	static Statement stmt = null;
// Undo command is Ctrl+Z 
//the shortcut for Redo is Ctrl+Y	
	
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
		public static void selectDB() throws SQLException {
			String sql = "SELECT username, password from users  ;";
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String user = rs.getString("username");
				String pass = rs.getString("password");
			//	System.out.println(user + " -> "+ pass);	
			}
			rs.close();
			stmt.close();
			con.close();
		//	System.out.println("All data retrived");
		}

	
//-------Create Table----------------------------------------------
	public static void createTable() {
		
		try {
		stmt = con.createStatement();
        String sql = "CREATE TABLE USER2 " +
                       "(ID INT PRIMARY KEY NOT NULL," +
                       " USERNAME TEXT NOT NULL, " + 
                       " password text not null  );";                    
        stmt.executeUpdate(sql);
        stmt.close();
        con.close();
        System.out.println("Table created successfully");
     } catch ( Exception e ) {
        System.err.println( e.getClass().getName() + ": " + e.getMessage() );
        System.exit(0);
     }
     
  }
//------Insert table----------------------------------------------
	public static void insertIntoTable() {
		try {
			stmt = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        String sql = "INSERT INTO USER2 (ID,USERNAME,PASS) " +
                       "VALUES (1, 'Paul', 123   );"; 
        try {
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        sql = "INSERT INTO USER2 (ID,NAME,AGE,ADDRESS,SALARY) " +
                 "VALUES (2, 'Allen', 123    );"; 
        try {
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        System.out.println("Inserted");
	}
//=================================================================	
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {

		connectionDB();
		 selectDB();
		//createTable();
		//insertIntoTable();
	}

}
