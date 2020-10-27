package Modelo;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import Interfaces.EspecialidadDAO;
import Utils.Conexion;


public class EspecialidadDAOimp implements EspecialidadDAO{
	Connection cn = Conexion.getConexion();
	@Override
	public List<Especialidad> ListadoEspecialidad() {
		List<Especialidad> lstEspecialidad=new ArrayList<>();
		try {
			String sql="SELECT * FROM especialidades";
			PreparedStatement pstm=cn.prepareStatement(sql);
			ResultSet rs=pstm.executeQuery();
			while(rs.next()) 
			{
				int codigo=rs.getInt(1);
				String especialidad=rs.getString(2);
				
				Especialidad esp = new Especialidad(codigo, especialidad);
				lstEspecialidad.add(esp);
				
			}
		}
		
		catch(Exception e)
		{
			
		}
		return lstEspecialidad;
	}

	@Override
	public Especialidad buscarXid(int codigoEspecialidad) {
		Especialidad esp= null;
		try{
			String sql="Select * from especialidades where id_especialidad = ?";
			PreparedStatement pstm = cn.prepareStatement(sql);
			pstm.setInt(1,codigoEspecialidad);
			ResultSet rs= pstm.executeQuery();
			while(rs.next()) 
			{
				int codigo=rs.getInt(1);
				String especialidad=rs.getString(2);
			
				
				esp = new Especialidad(codigo, especialidad);
			}
		}
		catch(Exception e){
			
		}
		return esp;
	}

}
