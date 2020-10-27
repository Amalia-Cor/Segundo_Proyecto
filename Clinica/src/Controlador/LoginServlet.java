package Controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.Login;
import Modelo.LoginDAO;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	LoginDAO dao=new LoginDAO();
	Login lo=new Login();
	int resultado;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String accion=request.getParameter("accion");
		if(accion.equals("Ingresar"))
		{
			String nom=request.getParameter("txtusuario");
			String pass=request.getParameter("txtpassword");


			lo.setUsername(nom);
			lo.setPassword(pass);
		
			resultado=dao.validar(lo);
			if(resultado==1) 
			{
				
				request.getRequestDispatcher("ListadoRegistro.jsp").forward(request, response);
			}else 
			{
				request.getRequestDispatcher("login.jsp").forward(request, response);

			}
		}
		
	}

}
