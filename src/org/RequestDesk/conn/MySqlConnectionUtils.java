package org.RequestDesk.conn;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.ServletContext;

public class MySqlConnectionUtils 
{
	public static Connection getMySQLConnection() throws ClassNotFoundException, SQLException 
	{
	     String hostName = "localhost";
	     String dbName = "requestdesk";
	     String userName = "root";
	     String password = "";
	     return getMySQLConnection(hostName, dbName, userName, password);
	 }
	
	public static Connection getMySQLConnection(String hostName, String dbName,
	         String userName, String password) throws SQLException,
	         ClassNotFoundException {
	    
	     Class.forName("com.mysql.jdbc.Driver");
	  
	     // URL Connection for MySQL:
	     // Example: 
	     // jdbc:mysql://localhost:3306/simplehr
	     String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName;
	  
	     Connection conn = DriverManager.getConnection(connectionURL, userName, password);
	     return conn;
	 }
}
