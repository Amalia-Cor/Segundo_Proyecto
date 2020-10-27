package Controlador;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.AtencionDAOImp;
import Modelo.EspecialidadDAOimp;
import Modelo.RegistroDAOImp;

import Modelo.Especialidad;
import Modelo.Atencion;
import Modelo.Registro;
/**
 * Servlet implementation class ResgistroServlet
 */
@WebServlet("/ResgistroServlet")
public class ResgistroServlet extends HttpServlet {
	AtencionDAOImp atencionDao=new AtencionDAOImp();
	EspecialidadDAOimp espeDao=new EspecialidadDAOimp();
	RegistroDAOImp reDao=new RegistroDAOImp();
	private void AgregarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try {
			String nombre=request.getParameter("txtNombre");
			String apellido=request.getParameter("txtApellido");
			String correo=request.getParameter("txtCorreo");
			String telefono=request.getParameter("txtTelefono");
			int codigoEspecialidad=Integer.parseInt(request.getParameter("cboEspecialidad"));
			Especialidad especialidad = espeDao.buscarXid(codigoEspecialidad);
			SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd"); //para darle el formato
			java.util.Date fecha= f.parse(request.getParameter("dtFecha")); //de donde vamos a obtener la fecha
			Date fechaSql= new Date(fecha.getTime()); //para que mysql lo guarde
			int codigoHra=Integer.parseInt(request.getParameter("cboAtencion"));
			Atencion atencion = atencionDao.buscarXid(codigoHra);
			Registro registro=new Registro();
			registro.setNombre(nombre);
			registro.setApellido(apellido);
			registro.setCorreo(correo);
			registro.setTelefono(telefono);
			registro.setEspecialidad(especialidad);			
			registro.setFecha(fechaSql);
			registro.setAtencion(atencion);
			String mensaje=reDao.Agregar(registro);
			if(mensaje.equals("SE REGISTRO SATISFACTORIAMENTE")){
				request.setAttribute("mensaje",mensaje);
				
			}
			else {
				request.setAttribute("error", mensaje);
				
			}
			request.getRequestDispatcher("Cita.jsp").forward(request,response);
			
			
			
		}catch(Exception e)
		{
			request.setAttribute("error",e);
			request.getRequestDispatcher("Cita.jsp").forward(request, response);

		}
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion=request.getParameter("accion");
		if(accion.equals("AgregarCliente")) 
		{
			AgregarCliente(request,response);
		}
	}
	

}
