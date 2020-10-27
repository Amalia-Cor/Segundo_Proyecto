package Modelo;

import Interfaces.Validar;
import java.sql.*;
import Utils.Conexion;
public class LoginDAO  implements Validar{
	Connection con;
	Conexion cn=new Conexion();
	PreparedStatement ps;
	ResultSet rs;
	
	@Override
	public int validar(Login login) {
		int r=0;
		String sql="Select * from login where username=? and password=?";
		try {
			con=cn.getConexion();
			ps=con.prepareStatement(sql);
			ps.setString(1,login.getUsername());
			ps.setString(2, login.getPassword());
	
			rs=ps.executeQuery();
			while(rs.next())
			{
				r=r+1;
				login.setUsername(rs.getString("username"));
				login.setPassword(rs.getString("password"));
			
			}
			if(r==1)
			{
				return 1;
			}
			else {
				return 0;
			}
		} catch (Exception e) {
			return 0;
		}
	}

}
