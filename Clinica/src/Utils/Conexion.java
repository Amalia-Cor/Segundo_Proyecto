package Utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
	
	public static Connection getConexion()
	{
		
		Connection cn = null;
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/clinica","root","");
			
		}catch(Exception e) 
		{
			
		}
		return cn;
	}
	
}
