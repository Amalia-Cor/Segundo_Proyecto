package Modelo;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import Interfaces.AtencionDAO;
import Utils.Conexion;
public class AtencionDAOImp implements AtencionDAO {
	Connection cn = Conexion.getConexion();
	@Override
	public List<Atencion> ListadoAtencion() {
		List<Atencion> lstAtencion=new ArrayList<>();
		try {
			String sql="SELECT * FROM atencion";
			PreparedStatement pstm=cn.prepareStatement(sql);
			ResultSet rs=pstm.executeQuery();
			while(rs.next()) 
			{
				int codigoH=rs.getInt(1);
				String hora=rs.getString(2);
				
				Atencion at = new Atencion(codigoH, hora);
				lstAtencion.add(at);
				
			}
		}
		
		catch(Exception e)
		{
			
		}
		return lstAtencion;
	}

	@Override
	public Atencion buscarXid(int codigoAtencion) {
		Atencion at= null;
		try{
			String sql="Select * from atencion where id_atencion = ?";
			PreparedStatement pstm = cn.prepareStatement(sql);
			pstm.setInt(1,codigoAtencion);
			ResultSet rs= pstm.executeQuery();
			while(rs.next()) 
			{
				int codigoH=rs.getInt(1);
				String hora=rs.getString(2);
			
				
				at = new Atencion(codigoH, hora);
			}
		}
		catch(Exception e){
			
		}
		return at;
	}

}
