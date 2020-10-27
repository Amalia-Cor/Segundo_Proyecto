package Modelo;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Interfaces.RegistroDAO;
import Utils.Conexion;

public class RegistroDAOImp  implements RegistroDAO{
	Connection cn= Conexion.getConexion();
	EspecialidadDAOimp espe = new EspecialidadDAOimp();
	AtencionDAOImp ate=new AtencionDAOImp();
	@Override
	public String Agregar(Registro registro) {
		String mensaje="";
		try{
			String sql="{Call sp_agregaRegistro(?,?,?,?,?,?,?,?)}";
			CallableStatement cstm = cn.prepareCall(sql);
			cstm.registerOutParameter(1, Types.VARCHAR);
			cstm.setString(2,registro.getNombre());
			cstm.setString(3, registro.getApellido());
			cstm.setString(4,registro.getCorreo());
			cstm.setString(5, registro.getTelefono());
			cstm.setInt(6,registro.getEspecialidad().getCodigo());
			cstm.setDate(7,registro.getFecha());
			cstm.setInt(8,registro.getAtencion().getCodigoH());
			cstm.executeUpdate();
			mensaje = cstm.getString(1);
			
		}catch(Exception e)
		{
			mensaje = e.toString();
		}
		return mensaje;
	}

	@Override
	public List<Registro> ListadoRegistro() {
		List<Registro> lstRegistro=new ArrayList<Registro>();
		try {
			String sql = "SELECT * FROM registro";
			PreparedStatement pstm = cn.prepareStatement(sql);
			ResultSet rs=pstm.executeQuery();
			while(rs.next()) 
			{
				int codigo=rs.getInt(1);
				String nombre=rs.getString(2);
				String apellido = rs.getString(3);
				String correo = rs.getString(4);
				String telefono=rs.getString(5);
				int codigoEspecialidad=rs.getInt(6);
			    Date fecha=rs.getDate(7);
			    int codigoAtencion=rs.getInt(8);
				
				
				Especialidad especialidad = espe.buscarXid(codigoEspecialidad);
				Atencion aten=ate.buscarXid(codigoAtencion);
				Registro registro = new Registro(codigo, nombre,apellido,correo,telefono,especialidad,fecha,aten);
				lstRegistro.add(registro);
				
				
						
			}
		}catch(Exception e)
		{
			
		}
		return lstRegistro;
	}

	

	

	

}
